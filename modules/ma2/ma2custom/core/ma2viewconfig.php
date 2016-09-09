<?php

class Ma2ViewConfig extends Ma2ViewConfig_parent
{

    public function getUser() {
        return oxRegistry::getSession()->getUser();
    }

    public function getUserId() {
        $oUser = oxRegistry::getSession()->getUser();
        return $oUser->getId();
    }

    public function getSessionVar($sVarName) {

        $oSession = oxRegistry::getSession();
        return $oSession->getVariable($sVarName);

    }

}