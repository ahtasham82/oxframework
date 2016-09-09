<?php

class Ma2Email extends Ma2Email_parent
{

    /**
     * Class constructor.
     */
    public function __construct() {
        parent::__construct();
    }

    public function AddCC($sAddress, $sName = '') {

        try {
            parent::AddCC($sAddress, $sName);

            // copying values as original class does not allow to access recipients array
            $this->_aRecipients[] = array($sAddress, $sName);
        } catch (Exception $oEx) {
        }

    }

    public function AddBCC($sAddress, $sName = '') {

        try {
            parent::AddBCC($sAddress, $sName);

            // copying values as original class does not allow to access recipients array
            $this->_aRecipients[] = array($sAddress, $sName);
        } catch (Exception $oEx) {
        }

    }

    public function send() {

        // shop info
        $oShop = $this->_getShop();

        if (!$oShop->isProductiveMode()) {

            if (count($this->getRecipient()) > 0) {

                $sExtraBody = ' [<br /> ';

                if (count($this->getRecipient()) > 0) {

                    $sSep = '';
                    $sExtraBody .= 'Orignal Empfänger: ';

                    foreach ($this->getRecipient() as $aReceiver) {
                        $sExtraBody .= $sSep . $aReceiver[0];
                        $sSep = ($sSep == '') ? ', ' : $sSep;
                    }

                    $sExtraBody .= '<br /> ';

                }

                $sExtraBody .= ' ]<br /><br />';

                $this->setBody($sExtraBody . $this->getBody());

            }

            $this->clearAllRecipients();

            $this->setRecipient('ahtasham82@gmail.com', 'Mirza Ahmad');

        }

        parent::send();

    }

}
