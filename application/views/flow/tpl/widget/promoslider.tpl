[{block name="dd_widget_promoslider"}]
    [{assign var="oBanners" value=$oView->getBanners()}]
    [{assign var="currency" value=$oView->getActCurrency()}]

    [{if $oBanners|@count}]
        [{oxscript include="js/libs/jquery.flexslider.min.js" priority=2}]
        [{oxstyle include="css/libs/jquery.flexslider.min.css"}]

        <div id="promo-carousel" class="flexslider">
            <ul class="slides">
                [{block name="dd_widget_promoslider_list"}]
                    [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                        [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                        [{if $sBannerPictureUrl}]
                            <li class="item">
                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                [{if $sBannerLink}]
                                    <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                [{/if}]

                                <img src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">

                                [{if $sBannerLink}]
                                    </a>
                                [{/if}]
                            </li>
                        [{/if}]
                    [{/foreach}]
                [{/block}]
            </ul>
        </div>
    [{/if}]
[{/block}]
