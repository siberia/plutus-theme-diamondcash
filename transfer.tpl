{include file="header.tpl" title="Transfer Between Accounts Page" nav="transfer"}

      <div>
        <h2 class="page-header">Transfer Between Accounts</h2>
      </div>

      <div>
        {if isset($smarty.session.flash.errors)}
          {foreach $smarty.session.flash.errors item=error}
            <div class="alert alert-danger" role="alert">{$error}</div>
          {/foreach}
        {/if}
        {if isset($smarty.session.flash.success)}
          <div class="alert alert-success" role="alert">{$smarty.session.flash.success}</div>
        {/if}

{assign var="weekday" value=$smarty.now|date_format:"%u"}
{assign var="hour" value=$smarty.now|date_format:"%H"}
{* We are on the weekend *}
{if $weekday == 6 || $weekday == 7}
  <div class="alert alert-warning" role="alert">Please note that debit card loads will be processed on the first working day after the weekend.</div>
{else}
{if $hour < 9 || $hour > 15}
  {if $weekday == 5}
    {if $hour > 15}
  <div class="alert alert-warning" role="alert">Please note that debit card loads will be processed on the first working day after the weekend.</div>
    {else}
    <div class="alert alert-wanring" role="alert">Please note that debit card loads will be processed during the course of tomorrow morning.</div>
    {/if}
  {else}
    <div class="alert alert-wanring" role="alert">Please note that debit card loads will be processed during the course of tomorrow morning.</div>
  {/if}
{/if}
{/if}

     <form method="post" class="form-horizontal" role="form" accept-charset="UTF-8">
<input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
       <div class="form-group">
         <label for="inputSourceAccount"  class="col-sm-2 control-label">Pay From Account</label>
         <div class="col-sm-10">
               <select class="form-control" name="source" id="source">
{foreach $accounts item=row}
{if $row.account_type eq 'wallet'}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>Diamond Cash Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{else}
{*
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>Diamond Cash Pre-paid Debit Card &mdash; {$row.masked_cardnumber}</option>
*}
{/if}
{/foreach}
{foreach $business_accounts item=row}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>Diamond Cash Business Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{/foreach}
      </select>
         </div>
       </div>
       <div class="form-group">
         <label for="inputSourceReference" class="col-sm-2 control-label">Pay From Reference</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="source_reference">
         </div>
       </div>
       <div class="form-group">
         <label for="inputSourceAccount"  class="col-sm-2 control-label">Pay To Account</label>
         <div class="col-sm-10">
      <select class="form-control" name="destination" id="destination">
{foreach $accounts item=row}
{if $row.account_type eq 'wallet'}
                 <option value="{$row.uuid}"{if isset($smarty.post.destination) && $smarty.post.destination eq $row.uuid} selected{/if}>Diamond Cash Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{else}
                 <option value="{$row.uuid}"{if isset($smarty.post.destination) && $smarty.post.destination eq $row.uuid} selected{/if}>Diamond Cash Pre-paid Debit Card &mdash; {$row.masked_cardnumber}</option>
{/if}
{/foreach}
{foreach $business_accounts item=row}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>Diamond Cash Business Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{/foreach}
      </select>
         </div>
       </div>
       <div class="form-group">
         <label for="inputDestinationReference" class="col-sm-2 control-label">Pay To Reference</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="destination_reference">
         </div>
       </div>
       <div class="form-group">
         <label for="inputAmount" class="col-sm-2 control-label">Amount</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="amount">
         </div>
       </div>
       <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <button data-disable-with="Processing ..." type="submit" class="btn btn-primary">Transfer</button>
          </div>
        </div>
      </form>
    </div>

{include file="footer.tpl"}
