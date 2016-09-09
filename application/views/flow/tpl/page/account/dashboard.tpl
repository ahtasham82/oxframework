[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]
    <div class="accountDashboardView">
        <h1 id="accountMain" class="page-header">[{oxmultilang ident="MY_ACCOUNT"}]
            "[{$oxcmp_user->oxuser__oxusername->value}]"</h1>

        <div class="row">
            <div class="col-xs-12 col-md-6">
                [{block name="account_dashboard_col1"}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountPassword" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="CHANGE_PASSWORD"}]</div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountNewsletter" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="NEWSLETTER_SUBSCRIBE_CANCEL"}]</div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountBillship" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS"}]</div>
                    </div>
                [{/block}]
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 text-right">
            <a href="[{$oViewConf->getLogoutLink()}]" class="btn btn-danger" role="getLogoutLink">
                <i class="fa fa-off"></i> [{oxmultilang ident="LOGOUT"}]
            </a>
        </div>
        <p>&nbsp;</p>
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]