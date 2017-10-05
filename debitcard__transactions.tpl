{*
 * Debitcard Transactions
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Debit Card Transactions Page" nav="accounts"}

<h1 class="hidden-print">Debit Card Transactions</h1>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Account Number</th>
      <th>Description</th>
      <th>Debit Card Number</th>
      <th>Card Status</th>
      <th>Actual Balance</th>
      <th>Available Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{$account.account_number}</td>
      <td>{$account.description}</td>
      <td>{$account.masked_cardnumber}</td>
      <td>{$balances->return->cardBalanceRecords->status}</td>
      <td>R {($balances->return->cardBalanceRecords->actualBalance)|string_format:"%.2f"}</td>
      <td>R {($balances->return->cardBalanceRecords->availableBalance)|string_format:"%.2f"}</td>
    </tr>
  </tbody>
</table>

<h4 class="page-header">Outstanding Authorisations</h4>

<table class="table table-striped table-condensed">
  <thead>
    <tr>
      <th class="col-md-2">Auth Date</th>
      <th class="col-md-2">Expires</th>
      <th>Description</th>
      <th>Type</th>
      <th>Sig/Pin</th>
      <th class="col-md-1">Amount</th>
      <th class="col-md-2">Status</th>
    </tr>
  </thead>
  <tbody>
{if isset($preauths->return->outstAuthRecords)}
{foreach $preauths->return->outstAuthRecords item=row}
    <tr>
      <td>{$row->transactionDate}</td>
      <td>{$row->expireDate}</td>
      <td>{$row->description}</td>
      <td>{$row->transactionType}</td>
      <td>&nbsp;</td>
      <td><div class="pull-right">R {$row->transactionAmount|string_format:"%.2f"}</td>
      <td>{$row->international}</td>
    </tr>
{foreachelse}
    <tr>
      <td colspan="7">There are no outstanding pre auth transactions.</td>
    </tr>
{/foreach}
{else}
    <tr>
      <td colspan="7">There are no outstanding pre auth transactions.</td>
    </tr>
{/if}
  </tbody>
</table>

<h4 class="page-header">Transactions</h4>

<table class="table table-striped table-condensed">
  <thead>
    <tr>
      <th>Txn Ref</th>
      <th>FNDS TransId</th>
      <th class="col-md-2">Auth Date</th>
      <th class="col-md-2">Cleared  Date</th>
      <th>Card Id</th>
      <th>Description</th>
      <th class="col-md-1">Debit (-)</th>
      <th class="col-md-1">Credit (+)</th>
    </tr>
  </thead>
  <tbody>
{foreach $transactions item=row}
    <tr>
      <td>{$row->transId|find_txn_ref_for_fnds_trans_id}</td>
      <td>{$row->transId|escape}</td>
      <td>{$row->date|escape}</td>
      <td>{$row->clearedDate|escape}</td>
      <td>{$row->cardId|escape}</td>
      <td>{$row->description|escape}</td>
      <td><div class="pull-right">ZAR {($row->debit)|number_format:2:'.':','}</div></td>
      <td><div class="pull-right">ZAR {($row->credit)|number_format:2:'.':','}</div></td>
    </tr>
{foreachelse}
    <tr>
      <td colspan="9">There are no transactions in past 90 day time span.</td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
