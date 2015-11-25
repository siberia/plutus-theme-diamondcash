{include file="header.tpl" title="Prepaid Electricity"}
      <div>
        <h2 class="page-header hidden-print">Prepaid Electricity</h2>
      </div>

      <div>
<h3 class="page-title">RECEIPT</h3>

<table class="table">
  <tbody>
    <tr>
      <th>Utility</th>
      <td>{$utility->name}</td>
    </tr>
    <tr>
      <th>{$utility->name} VAT No.</th>
      <td>{$receipt->vatno}</td>
    </tr>
    <tr>
      <th>{$utility->name} Address</th>
      <td>{$receipt->address}</td>
    </tr>
    <tr>
      <th>{$utility->name} Receipt No.</th>
      <td>{$tokens.0->rctnum}</td>
    </tr>
    <tr>
      <th>Date</th>
      <td>{$date}</td>
    </tr>
    <tr>
      <th>Our Ref</th>
      <td>{$reference}</td>
    </tr>
  </tbody>
</table>

<h4 class="page-title">Customer</h4>

<table class="table">
  <tbody>
    <tr>
      <th>Customer</th>
      <td>{$customer_info->name}</td>
    </tr>
    <tr>
      <th>Address</th>
      <td>{$customer_info->address}</td>
    </tr>
  </tbody>
</table>

<h4 class="page-title">Meter Info</h4>

<table class="table">
  <thead>
    <th>Meter Number</th>
    <th>Tarrif</th>
    <th>SGC</th>
    <th>TI</th>
    <th>ALG</th>
    <th>KRN</th>
    <th>TTC</th>
    <th>MT</th>
  </thead>
  <tbody>
    <td>{$meter_number}</td>
    <td>{$tariff}</td>
    <td>{$customer_info->supgrpref}</td>
    <td>{$customer_info->tariff_index}</td>
    <td>{$customer_info->alg_code}</td>
    <td>{$customer_info->key_rev_num}</td>
    <td>{$customer_info->token_tech_code}</td>
    <td>{$customer_info->meter_type}</td>
  </tbody>
</table>

<h4 class="page-title">Tokens</h4>

{foreach $tokens item=row}

<table class="table">
  <tbody>
    <tr>
      <th>Token Type</th>
      <td>{$row->type}</td>
    </tr>
    <tr>
      <th>Units</th>
      <td>{$row->units} kWh</td>
    </tr>
    <tr>
      <th>Tariff</th>
      <td>{$row->tariff}</td>
    </tr>
    <tr>
      <th>Token</th>
      <td><h4>{$row->token|ststoken}</h4></td>
    </tr>
    <tr>
      <th>Electricity (excl. VAT)</th>
      <td>R {($row->amount/100)|number_format:2:'.':','}</td>
    </tr>
    <tr>
      <th>VAT</th>
      <td>R {($row->tax/100)|number_format:2:'.':','}</td>
    </tr>
    <tr>
     <th>Total</th>
     <td>R {(($row->amount+$row->tax)/100)|number_format:2:'.':','}</td>
    </tr>
  </tbody>
</table>
{/foreach}

    </div>

{include file="footer.tpl"}
