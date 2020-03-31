{**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{extends file="helpers/options/options.tpl"}

{block name="input"}
  {if $field['type'] == 'color'}
    <div class="col-lg-2">
      <div class="input-group">
        <input
                type="color"
                data-hex="true"
                class="{if isset($input.class)}{$field['class']}{else}color mColorPickerInput{/if}"
                name="{$key}"
                value="{$field['value']|escape:'html':'UTF-8'}"
        />
      </div>
    </div>
  {else}
    {$smarty.block.parent}
  {/if}
{/block}
