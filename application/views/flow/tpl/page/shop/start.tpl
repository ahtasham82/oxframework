[{capture append="oxidBlock_content"}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
    [{assign var='rsslinks' value=$oView->getRssLinks()}]
    [{oxscript include="js/pages/start.min.js"}]

    [{oxifcontent ident="oxstartwelcome" object="oCont"}]
        <div class="welcome-teaser">[{$oCont->oxcontents__oxcontent->value}]</div>
    [{/oxifcontent}]

    [{*if $oViewConf->getViewThemeParam('bl_showManufacturerSlider')}]
        [{include file="widget/manufacturersslider.tpl"}]
    [{/if*}]

    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl"}]