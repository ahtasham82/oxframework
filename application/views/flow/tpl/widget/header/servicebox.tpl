<div class="topPopList">
    [{block name="widget_header_servicebox_flyoutbox"}]
        <span class="lead">[{oxmultilang ident="ACCOUNT"}]</span>
        <div class="flyoutBox">
            <ul id="services" class="list-unstyled">
                [{block name="widget_header_servicebox_items"}]
                    <li>
                        <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="MY_ACCOUNT"}]</a>
                    </li>
                [{/block}]
            </ul>
        </div>
    [{/block}]
</div>