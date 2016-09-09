<nav id="account_menu">
    <ul class="list-group">
        [{block name="account_menu"}]
            <li class="list-group-item[{if $active_link == "password"}] active[{/if}]">
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" title="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
            </li>
            <li class="list-group-item[{if $active_link == "newsletter"}] active[{/if}]">
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" title="[{oxmultilang ident="NEWSLETTER_SETTINGS"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
            </li>
            <li class="list-group-item[{if $active_link == "billship"}] active[{/if}]">
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" title="[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
            </li>
        [{/block}]
    </ul>
</nav>