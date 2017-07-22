{*
 * Customers dashboard - shows their accounts page.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Accounts Page" nav="accounts"}

      <div>
        <h2 class="page-header">Diamond Cash Card Dashboard</h2>
      </div>

      <div>

{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

{if !is_null($paymentbatches)}
  {if $paymentbatches->count() > 0}
    <div class="alert alert-info">You have <strong>{$paymentbatches->count()}</strong> pending payment batch{if 1 != $paymentbatches->count()}es{/if} for processing.</div>
  {/if}
{/if}

        <div class="alert alert-info">
          Are you expecting a deposit and cannot see it?  No problem, call the call centre on 086 111 3673.  This can happen if your reference was not correct when the deposit was made.
        </div>

        <div class="alert alert-info">
          <p>
            To deposit money into your account, you can deposit money into the following account: <br />
            <br />
            <strong>Bank:</strong> ABSA Bank<br />
            <strong>Account Number:</strong> 4090578095<br />
            <strong>Branch Code:</strong> 632005<br />
            <strong>Reference:</strong> YOURGOVID
          </p>
        </div>

        <h3>My Accounts</h3>

        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th>Account Name</th>
              <th>Actual Balance</th>
              <th>Available Balance</th>
            </tr>
          </thead>
          <tbody>
{foreach $accounts item=row}
            <tr>
{if $row.account_type eq 'wallet'}
              <td><i class="fa fa-money"></i> Diamond Account &mdash; {$row.account_number} <div class="pull-right"><a href="/accounts/{$row.uuid}/transactions">View Transactions</a> &bull; <a href="/accounts/{$row.uuid}/statements">View statements</a></div></td>
              <td><div class="pull-right">R {($row.balance/100)|string_format:"%.2f"}</div></td>
{* Users who have had cash attached by the AFU court order should always see 0 as the available balance. *}
{if in_array($smarty.session.silo_id, [9, 10, 11, 13, 14, 15, 16, 17])}
              <td><div class="pull-right">R 0.00</div></td>
{else}
              <td><div class="pull-right">R {($row.balance/100)|string_format:"%.2f"}</div></td>
{/if}
{else}
              <td><i class="fa fa-credit-card"></i> Diamond Cash Card &mdash; {$row.masked_cardnumber} <div class="pull-right"></div></td>
              <td><div class="pull-right">R {($row.account_number|find_actual_balance_for_debitcard)/100|string_format:"%.2f"}</div></td>
              <td><div class="pull-right">R {($row.account_number|find_available_balance_for_debitcard)/100|string_format:"%.2f"}</div></td>
{/if}
            </tr>
{/foreach}
{foreach $business_accounts item=row}
            <tr>
              <td><i class="fa fa-money"></i> Diamond Business Account &mdash; {$row.account_number} <div class="pull-right"><a href="/businessaccounts/{$row.uuid}/users">View Users</a> &bull; <a href="/businessaccounts/{$row.uuid}/transactions">View Transactions</a> &bull; <a href="/businessaccounts/{$row.uuid}/statements">View statements</a></div></td>
              <td><div class="pull-right">R {($row.balance/100)|string_format:"%.2f"}</div></td>
            </tr>
{/foreach}
          </tbody>
        </table>
      </div>

{include file="footer.tpl"}
