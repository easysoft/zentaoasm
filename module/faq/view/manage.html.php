<?php
/**
 * The manage view of faq module of XiRangCSM
 *
 * @copyright   Copyright 2009-2011 青岛易软天创网络科技有限公司 (QingDao Nature Easy Soft Network Technology Co,LTD www.cnezsoft.com)
 * @license     LGPL (http://www.gnu.org/licenses/lgpl.html)
 * @author      Congzhi Chen<congzhi@cnezsoft.com>
 * @package     faq
 * @version     $Id: buildform.html.php 1914 2011-06-24 10:11:25Z yidong@cnezsoft.com $
 * @link        http://www.zentao.net
 */
?>
<?php include '../../common/view/header.admin.html.php';?>
<table class='table-1 bd-none'>
  <tr valign='top'>
    <td class='w-200px'>
      <table class='table-1'>
        <caption><?php echo $lang->faq->productList;?></caption>
        <tr><td><?php echo html::select('product', $productList, $selectedProductID, 'class=select-1 onchange=switchProduct(this.value)');?></td></tr>
        <?php if(!empty($categories)):?>
        <?php foreach($categories as $id => $category):?>
        <tr>
          <td>
          <?php echo html::a($this->inLink('manage', "productID=$selectedProductID&categoryID=$category->id"), $category->name);?>
          </td>
        </tr>
        <?php endforeach;?>
        <?php endif;?>
      </table>
    </td>
    <td>
      <table class='table-1 bd'>
        <caption>
          <div class='f-left'><?php echo ($selectedProductID == '0'? $lang->product->all : $productList[$selectedProductID]) . $lang->arrow . $lang->faq->faqList;?></div>
          <div class='f-right'><?php echo html::a($this->inLink('create', "productID=$selectedProductID&categoryID=$categoryID"), $lang->faq->create);?></div>
        </caption>
        <?php $i = 1; foreach($faqs as $id => $faq):?>
        <tr>
          <td>
            <?php echo $i . '. Q: ' . $faq->request . '?' . "<br />" . 'A:' . $faq->answer; $i++;?><br />
            <div class='a-right'>
              <?php 
              echo html::a($this->inLink('edit', "FAQID=$faq->id"), $lang->faq->edit);
              echo html::a($this->inLink('delete', "FAQID=$faq->id"), $lang->faq->delete, "hiddenwin");
              ?>
            </div>
          </td>
        </tr>
        <?php endforeach;?>
      </table>
    </td>
  </tr>
</table>
<?php include '../../common/view/footer.admin.html.php';?>
