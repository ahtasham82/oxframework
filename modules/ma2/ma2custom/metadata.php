<?php

    $sMetadataVersion = '1.0';
    $aModule          = array(
        'id'          => 'ma2custom',
        'title'       => '<strong>Ma2 Custom</strong>',
        'description' => 'Ma2 Custom',
        'thumbnail'   => '',
        'version'     => '1.0',
        'author'      => 'Mirza Ahmad',
        'email'       => 'ahtasham82@gmail.com',
        'url'         => '',
        'extend'      => array(
            'oxemail'               => 'ma2/ma2custom/core/ma2email',
            'oxviewconfig'          => 'ma2/ma2custom/core/ma2viewconfig'
        ),
        'templates'   => array(
        ),
        'blocks'      => array(
        ),
        'settings'    => array(
        )
    );
