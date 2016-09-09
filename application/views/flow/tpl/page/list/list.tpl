[{oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
[{oxscript add="$(window).load(function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '#content .subcatList .row .panel-body' ) ); } });"}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]

[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{oxmultilang ident="BRAND"}]
                [{elseif $listType=='vendor'}]
                    [{oxmultilang ident="VENDOR"}]
                [{/if}]
            </h3>
            <div class="featured icon">
                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{block name="page_list_listhead"}]
        [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
            <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture img-responsive img-thumbnail">
        [{/if}]

        <div class="page-header">
            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            <h1>
                [{$oView->getTitle()}]
                [{if $rsslinks.activeCategory}]
                    <a class="rss" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                        <i class="fa fa-rss"></i>
                    </a>
                [{/if}]
            </h1>
        </div>

        [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
        [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
            <p id="catDescLocator" class="categoryDescription">
                <em>[{$actCategory->oxcategories__oxdesc->rawValue}]</em>
            </p>
        [{/if}]

        [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1}]
            <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
            <hr/>
        [{/if}]

        [{if $oView->hasVisibleSubCats()}]
            [{assign var="iSubCategoriesCount" value=0}]
            <div class="subcatList">
                <div class="row">
                    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                        [{if $category->getContentCats()}]
                            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                                <div class="box">
                                    <h3>
                                        <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                    </h3>
                                    <ul class="content"></ul>
                                </div>
                            [{/foreach}]
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0}]
                            </div><div class="row">
                        [{/if}]
                        [{if $category->getIsVisible()}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <div class="col-xs-12 col-sm-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}]</a>
                                    </div>
                                    <div class="panel-body">
                                        [{if $iconUrl}]
                                            <a href="[{$category->getLink()}]">
                                                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" class="img-responsive subcat-icon">
                                            </a>
                                        [{else}]
                                            &nbsp;
                                            [{* category without icon image*}]
                                        [{/if}]

                                        [{if $category->getHasVisibleSubCats()}]
                                            <hr/>
                                            <ul class="list-unstyled">
                                                [{foreach from=$category->getSubCats() item=subcategory}]
                                                    [{if $subcategory->getIsVisible()}]
                                                        [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                                            <li>
                                                                <a href="[{$ocont->getLink()}]"><strong>[{$ocont->oxcontents__oxtitle->value}]</strong></a>
                                                            </li>
                                                        [{/foreach}]
                                                        <li>
                                                            <a href="[{$subcategory->getLink()}]">[{$subcategory->oxcategories__oxtitle->value}]</a>
                                                        </li>
                                                    [{/if}]
                                                [{/foreach}]
                                            </ul>
                                        [{/if}]
                                    </div>
                                </div>
                            </div>
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0}]
                            </div>
                            <div class="row">
                        [{/if}]
                    [{/foreach}]
                </div>
            </div>
            <hr/>
        [{/if}]
    [{/block}]

    [{block name="page_list_listbody"}]
        &nbsp;
    [{/block}]
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]