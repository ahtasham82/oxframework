<?php
/**
 * This file is part of OXID eShop Community Edition.
 *
 * OXID eShop Community Edition is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eShop Community Edition is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2016
 * @version   OXID eShop CE
 */

/**
 * Class oxOnlineCaller makes call to given URL which is taken from child classes and sends request parameter.
 *
 * @internal Do not make a module extension for this class.
 * @see      http://wiki.oxidforge.org/Tutorials/Core_OXID_eShop_classes:_must_not_be_extended
 *
 * @ignore   This class will not be included in documentation.
 */
abstract class oxOnlineCaller
{

    const ALLOWED_HTTP_FAILED_CALLS_COUNT = 4;

    /** Amount of seconds for curl execution timeout. */
    const CURL_EXECUTION_TIMEOUT = 5;

    /**
     * @var oxCurl
     */
    private $_oCurl;

    /**
     * @var oxOnlineServerEmailBuilder
     */
    private $_oEmailBuilder;

    /**
     * @var oxSimpleXml
     */
    private $_oSimpleXml;

    /**
     * Gets XML document name.
     *
     * @return string XML document tag name.
     */
    abstract protected function _getXMLDocumentName();

    /**
     * Gets service url.
     *
     * @return string Web service url.
     */
    abstract protected function _getServiceUrl();

    /**
     * Sets dependencies.
     *
     * @param oxCurl                     $oCurl
     * @param oxOnlineServerEmailBuilder $oEmailBuilder
     * @param oxSimpleXml                $oSimpleXml
     */
    public function __construct(oxCurl $oCurl, oxOnlineServerEmailBuilder $oEmailBuilder, oxSimpleXml $oSimpleXml)
    {
        $this->_oCurl = $oCurl;
        $this->_oEmailBuilder = $oEmailBuilder;
        $this->_oSimpleXml = $oSimpleXml;
    }

    /**
     * Makes curl call with given parameters to given url.
     *
     * @param oxOnlineRequest $oRequest
     *
     * @return null|string In XML format.
     */
    public function call(oxOnlineRequest $oRequest)
    {
        $sOutputXml = null;
        $iFailedCallsCount = oxRegistry::getConfig()->getSystemConfigParameter('iFailedOnlineCallsCount');
        try {
            $sXml = $this->_formXMLRequest($oRequest);
            $sOutputXml = $this->_executeCurlCall($this->_getServiceUrl(), $sXml);
            if ($this->_getCurl()->getStatusCode() != 200) {
                /** @var oxException $oException */
                $oException = oxNew('oxException');
                throw $oException;
            }
            $this->_resetFailedCallsCount($iFailedCallsCount);
        } catch (Exception $oEx) {
            if ($iFailedCallsCount > self::ALLOWED_HTTP_FAILED_CALLS_COUNT) {
                $sXml = $this->_formEmail($oRequest);
                $this->_sendEmail($sXml);
                $this->_resetFailedCallsCount($iFailedCallsCount);
            } else {
                $this->_increaseFailedCallsCount($iFailedCallsCount);
            }
        }

        return $sOutputXml;
    }

    /**
     * Forms email.
     *
     * @param oxOnlineRequest $oRequest
     *
     * @return string
     */
    protected function _formEmail($oRequest)
    {
        return $this->_formXMLRequest($oRequest);
    }

    /**
     * Forms XML request.
     *
     * @param oxOnlineRequest $oRequest
     *
     * @return string
     */
    protected function _formXMLRequest($oRequest)
    {
        return $this->_getSimpleXml()->objectToXml($oRequest, $this->_getXMLDocumentName());
    }

    /**
     * Gets simple XML.
     *
     * @return oxSimpleXml
     */
    protected function _getSimpleXml()
    {
        return $this->_oSimpleXml;
    }

    /**
     * Gets curl.
     *
     * @return \oxCurl
     */
    protected function _getCurl()
    {
        return $this->_oCurl;
    }

    /**
     * Gets email builder.
     *
     * @return oxOnlineServerEmailBuilder
     */
    protected function _getEmailBuilder()
    {
        return $this->_oEmailBuilder;
    }

    /**
     * Executes CURL call with given parameters.
     *
     * @param string $sUrl
     * @param string $sXml
     *
     * @return string
     */
    private function _executeCurlCall($sUrl, $sXml)
    {
        $oCurl = $this->_getCurl();
        $oCurl->setMethod('POST');
        $oCurl->setUrl($sUrl);
        $oCurl->setParameters(array('xmlRequest' => $sXml));
        $oCurl->setOption(
            oxCurl::EXECUTION_TIMEOUT_OPTION,
            static::CURL_EXECUTION_TIMEOUT
        );
        $sOutput = $oCurl->execute();

        return $sOutput;
    }

    /**
     * Sends an email with server information.
     *
     * @param string $sBody
     */
    private function _sendEmail($sBody)
    {
        $oEmail = $this->_getEmailBuilder()->build($sBody);
        $oEmail->send();
    }

    /**
     * Resets config parameter iFailedOnlineCallsCount if it's bigger than 0.
     *
     * @param int $iFailedOnlineCallsCount
     */
    private function _resetFailedCallsCount($iFailedOnlineCallsCount)
    {
        if ($iFailedOnlineCallsCount > 0) {
            oxRegistry::getConfig()->saveSystemConfigParameter('int', 'iFailedOnlineCallsCount', 0);
        }
    }

    /**
     * increases failed calls count.
     *
     * @param int $iFailedOnlineCallsCount
     */
    private function _increaseFailedCallsCount($iFailedOnlineCallsCount)
    {
        oxRegistry::getConfig()->saveSystemConfigParameter('int', 'iFailedOnlineCallsCount', ++$iFailedOnlineCallsCount);
    }
}
