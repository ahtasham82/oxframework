[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<div class="content">
    <form class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="fnc" value="registeruser">
    <input type="hidden" name="cl" value="register">
    <input type="hidden" name="lgn_cook" value="0">
    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
    <input type="hidden" name="option" value="3">
    <h3 class="block-head">[{oxmultilang ident="ACCOUNT_INFORMATION"}]</h3>
        <ul class="form">
            [{include file="form/fieldset/user_account.tpl"}]
            [{if $oView->isActive('PsLogin') }]
                <li>
                    <label for="orderConfirmAgbBottom">[{oxmultilang ident="TERMS_AND_CONDITIONS"}]</label>
                    <input type="hidden" name="ord_agb" value="0">
                    <div class="checkbox">
                        <input id="checkAgbTop" type="checkbox" class="checkbox" name="ord_agb" value="1">
                        <label class="glyphicon-ok" for="checkAgbTop"></label>
                    </div>
                    [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                        <label for="checkAgbTop" class="checkout-agb-label">
                            [{$oContent->oxcontents__oxcontent->value}]
                        </label>
                    [{/oxifcontent}]
                    <div class="clearfix"></div>
                </li>
            [{/if}]
        </ul>
    <h3 class="block-head">[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
        <ul class="form">[{include file="form/fieldset/user_billing.tpl"}]</ul>
    </form>
    [{if $oView->isActive('PsLogin') }]
        <div id="popup1" class="popupBox corners FXgradGreyLight glowShadow">
             <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
             [{oxifcontent ident="oxagb" object="oContent"}]
                [{$oContent->oxcontents__oxcontent->value}]
             [{/oxifcontent}]
        </div>
        <div id="popup2" class="popupBox corners FXgradGreyLight glowShadow">
             <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
             [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
                [{$oContent->oxcontents__oxcontent->value}]
             [{/oxifcontent}]
        </div>
    [{/if}]
</div>