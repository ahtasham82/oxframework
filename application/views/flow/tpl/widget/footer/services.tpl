[{block name="footer_services"}]
    <ul class="services list-unstyled">
        [{block name="footer_services_items"}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a></li>
            [{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
                <li><a href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="HELP"}]</a></li>
            [{/if}]
            [{if $oViewConf->getViewThemeParam('blFooterShowLinks')}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">[{oxmultilang ident="LINKS"}]</a></li>
            [{/if}]
            [{*<li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="ACCOUNT"}]</a></li>*}]
        [{/block}]
    </ul>
[{/block}]