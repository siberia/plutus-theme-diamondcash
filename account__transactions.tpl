{*
 * Account Transactions - show the user their wallet account transactions.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Account Transactions Page" nav="accounts"}

<h1 class="hidden-print">Account Transactions</h1>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Account Number</th>
      <th>Description</th>
      <th>Account Type</th>
      <th>Available Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{$account.account_number}</td>
      <td>{$account.description|escape}</td>
      <td>{if $account.account_type == 'wallet'}Diamond Account{elseif $account.account_type == 'business'}Business Account{/if}</td>
      <td>R {($account.balance/100)|string_format:"%.2f"}</td>
    </tr>
  </tbody>
</table>

<form method="POST" class="form-inline">
  <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
{include file="_partials/reports-filter-month.tpl"}
<button type="submit" class="btn btn-info">Filter</button>
</form>

<table class="table table-striped">
  <thead>
    <tr>
      <th>Action Date</th>
      <th>Reference</th>
      <th>Description</th>
      <th>&nbsp;</th>
{if $smarty.session.is_admin}
      <th>Debit</th>
      <th>Credit</th>
      <th>Balance</th>
{else}
      <th>Amount</th>
{/if}
    </tr>
  </thead>
  <tbody>
{if isset($closing_balance)}
{assign var=running_total value=$closing_balance}
{else}
{assign var=running_total value=0}
{/if}
    <tr>
      <td></td>
      <td></td>
      <td>CLOSING BALANCE</td>
      <td></td>
{if $smarty.session.is_admin}
      <td><div class="pull-right"></div></td>
      <td><div class="pull-right"></div></td>
      <td><div class="pull-right">R {($running_total/100)|string_format:"%.2f"}</div></td>
{else}
      <td><div class="pull-right">R {($running_total/100)|string_format:"%.2f"}</div></td>
{/if}
    </tr>
{foreach $transactions item=row}
    <tr>
      <td>{$row.action_date}</td>
      <td>{$row.transaction_reference}</td>
      <td>{$row.reference1|escape}</td>
      <td>{$row.reference2|escape}</td>
{if $smarty.session.is_admin}
      <td><div class="pull-right">{if $row.amount < 0}R {($row.amount/100*-1)|string_format:"%.2f"}{else}&mdash;{/if}</div></td>
      <td><div class="pull-right">{if $row.amount > 0}R {($row.amount/100)|string_format:"%.2f"}{else}&mdash;{/if}</div></td>
      <td><div class="pull-right">R {($running_total/100)|string_format:"%.2f"}</div></td>
{else}
      <td><div class="pull-right">R {($row.amount/100)|string_format:"%.2f"}</div></td>
{/if}
    </tr>
{assign var=running_total value=$running_total+($row.amount*-1)}
{/foreach}
    <tr>
      <td></td>
      <td></td>
      <td>OPENING BALANCE</td>
      <td></td>
{if $smarty.session.is_admin}
      <td><div class="pull-right"></div></td>
      <td><div class="pull-right"></div></td>
      <td><div class="pull-right">R {($running_total/100)|string_format:"%.2f"}</div></td>
{else}
      <td><div class="pull-right">R {($running_total/100)|string_format:"%.2f"}</div></td>
{/if}
    </tr>
  </tbody>
</table>

{include file="footer.tpl"}
