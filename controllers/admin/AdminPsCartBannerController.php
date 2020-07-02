<?php
/**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
class AdminPsCartBannerController extends ModuleAdminController
{
    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->bootstrap = true;
        $this->className = 'Configuration';
        $this->table = 'configuration';

        parent::__construct();

        $this->fields_options = [
            'pscartbanner' => [
                'fields' => [
                    PsCartBanner::CONFIG_BANNER_CONTENT => [
                        'type' => 'textareaLang',
                        'rows' => 5,
                        'cols' => 40,
                        'title' => $this->l('Banner content'),
                        'desc' => strtr(
                            $this->l('You can replace current icon "local_shipping" by another from [link]material icon library[/link] or replace it by an image thanks to content editor.'),
                            [
                                '[link]' => '<a href="https://material.io/resources/icons/" target="_blank">',
                                '[/link]' => '</a>',
                            ]
                        ),
                        'validation' => 'isCleanHtml',
                        'lang' => true,
                        'autoload_rte' => true,
                    ],
                    PsCartBanner::CONFIG_BANNER_BORDER_COLOR => [
                        'type' => 'color',
                        'title' => $this->l('Banner border color'),
                        'validation' => 'isColor',
                        'required' => false,
                    ],
                ],
                'submit' => [
                    'title' => $this->l('Save'),
                ],
            ],
        ];
    }
}
