{include file="header.tpl" title="Account Transactions Page"}

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


<table class="table table-striped">
  <thead>
    <tr>
      <th>Action Date</th>
      <th>Reference</th>
      <th>Description</th>
      <th>&nbsp;</th>
      <th>Amount</th>
    </tr>
  </thead>
  <tbody>
{foreach $transactions item=row}
    <tr>
      <td>{$row.action_date}</td>
      <td>{$row.transaction_reference}</td>
      <td>{$row.reference1|escape}</td>
      <td>{$row.reference2|escape}</td>
      <td><div class="pull-right">R {($row.amount/100)|string_format:"%.2f"}</div></td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
