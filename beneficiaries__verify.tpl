{*
 * Confirm beneficiary payments
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2016 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Confirm Beneficiaries Payments Page" nav="beneficiaries"}

      <div>
        <h2 class="page-header">Confirm Beneficiary Payments</h2>
      </div>

{include file="_partials/errors.tpl"}

      <div>
        <h3>Paying From:</h3>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Account Number</th>
      <th>Description</th>
      <th>Available Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{$account.account_number}</td>
      <td>{$account.description|escape}</td>
      <td>R {($account.balance/100)|string_format:"%.2f"}</td>
    </tr>
  </tbody>
</table>

        <h3>Paying To:</h3>

<form method="post"  accept-charset="UTF-8">
<input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
        <input type="hidden" name="step" value="confirmed" />
        <input type="hidden" name="source" value="{$source}" />
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th>Account Name</th>
              <th>Your Reference</th>
              <th>Their Reference</th>
              <th>Amount</th>
            </tr>
          </thead>
          <tbody>
{foreach $beneficiaries item=row}
            <tr>
              <td>{$row.name|escape} <div class="pull-right">{$row.account_number}</td></td>
              <td><input type="hidden" name="beneficiary[]" value="{$row.id}" /><input type="hidden" name="reference1[]" value="{$row.reference1|escape}">{$row.reference1|escape}</td>
              <td><input type="hidden" name="reference2[]" value="{$row.reference2|escape}">{$row.reference2|escape}</td>
              <td><input type="hidden" name="amount[]" value="{($row.amount/100)|string_format:"%.2f"}">R {($row.amount/100)|string_format:"%.2f"}</td>
            </tr>
{/foreach}
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td><div class="pull-right">Total:</div></td>
              <td>R {($total/100)|string_format:"%.2f"}</td>
            </tr>

          </tbody>
        </table>
<div class="pull-right">
<input data-disable-with="Processing ..." type="submit" class="btn btn-primary" value="Confirm Payments" />
</div>
</form>

<p class="clearfix">&nbsp;</td>

      </div>

{include file="footer.tpl"}
