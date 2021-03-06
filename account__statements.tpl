{include file="header.tpl" title="Your Statements" nav="accounts"}

<h1>Download your statement</h1>

<p>
Please choose a format to download your transaction data in.  Choose from CSV, PDF or Excel.
</p>

{if $months|@count eq 0}
<p>
You presently do not have any account statements available for download.
</p>
{/if}

<table class="table">
  <thead>
    <tr>
      <th>Month</th>
      <th>Format</th>
    </tr>
  </thead>
  <tbody>
{foreach $months item=row}
    <tr>
      <td>{$row.month_name}</td>
      <td>
        <a href="/{if $account.account_type eq 'wallet'}accounts{else}businessaccounts{/if}/{$account.uuid}/statements/{$row.month_yyyymm}/csv">CSV</a>
        {* &bull; PDF*}
        &bull;
        <a href="/{if $account.account_type eq 'wallet'}accounts{else}businessaccounts{/if}/{$account.uuid}/statements/{$row.month_yyyymm}/pdf">PDF</a>
        &bull;
        <a href="/{if $account.account_type eq 'wallet'}accounts{else}businessaccounts{/if}/{$account.uuid}/statements/{$row.month_yyyymm}/xlsx">Excel</a>
      </td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
