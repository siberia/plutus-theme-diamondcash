{include file="header.tpl" title="Business Account Users"}

<h1>Users with access to this business account</h1>

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

<p>
Should you need to change who can view this business account and/or transact on this account
please send a fax on a company letter head to us to make the changes.
</p>

<table class="table">
  <thead>
    <tr>
      <th>Person</th>
      <th>Rights</th>
    </tr>
  </thead>
  <tbody>
{foreach $users item=row}
    <tr>
      <td>{$row.first_name|escape} {$row.last_name|escape}</td>
      <td>{$row.rights}</td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
