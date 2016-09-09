[{assign var="aFcPoCCPaymentMetaData" value=$oView->fcpoGetCCPaymentMetaData()}]
[{assign var="aFcPoOnlinePaymentMetaData" value=$oView->fcpoGetOnlinePaymentMetaData()}]
[{assign var="dynvalue" value=$oView->getDynValue()}]
[{assign var="sFcPoTemplatePath" value='mobile'}] 
[{if $sPaymentID == "fcpocreditcard" && $oView->fcpoGetCreditcardType() == "ajax"}]
    [{assign var="sFcPoTemplatePath" value=$sFcPoTemplatePath|cat:'/fcpo_payment_creditcard_ajax.tpl'}]
    [{include file=$oViewConf->fcpoGetAbsModuleTemplateFrontendPath($sFcPoTemplatePath)}]
[{elseif $sPaymentID == "fcpocreditcard" && $oView->fcpoGetCreditcardType() == "hosted"}]
    [{assign var="sFcPoTemplatePath" value=$sFcPoTemplatePath|cat:'/fcpo_payment_creditcard_hosted.tpl'}]
    [{include file=$oViewConf->fcpoGetAbsModuleTemplateFrontendPath($sFcPoTemplatePath)}]
[{elseif $sPaymentID == "fcpodebitnote"}]
    [{assign var="sFcPoTemplatePath" value=$sFcPoTemplatePath|cat:'/fcpo_payment_debitnote.tpl'}]
    [{include file=$oViewConf->fcpoGetAbsModuleTemplateFrontendPath($sFcPoTemplatePath)}]
[{elseif $sPaymentID == "fcpoonlineueberweisung"}]
    [{assign var="sFcPoTemplatePath" value=$sFcPoTemplatePath|cat:'/fcpo_payment_onlinetransfer.tpl'}]
    [{include file=$oViewConf->fcpoGetAbsModuleTemplateFrontendPath($sFcPoTemplatePath)}]
[{elseif $sPaymentID == "fcpoklarna" || $sPaymentID == "fcpoklarna_installment"}]
    [{assign var="sFcPoTemplatePath" value=$sFcPoTemplatePath|cat:'/fcpo_payment_klarna.tpl'}]
    [{include file=$oViewConf->fcpoGetAbsModuleTemplateFrontendPath($sFcPoTemplatePath)}]
[{else}]
    [{$smarty.block.parent}]
[{/if}]