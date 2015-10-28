{include file="header.tpl" title="Autoload Settings"}

      <div>
        <h2 class="page-header">Autoload Settings</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

      <form method="post" class="form-horizontal" role="form">
{include file="_partials/csrf.tpl"}
        <div class="form-group">
          <label for="inputAutoloadType" class="col-sm-2 control-label">Autoload Type</label>
          <div class="col-sm-10">
            <select name="autoload_type" class="form-control" id="inputAutoloadType">
              <option value="percentage"{if $autoload_type eq 'percentage'} selected{/if}>Percentage</option>
              <option value="money"{if $autoload_type eq 'money'} selected{/if}>Monetary Value</option>
            </select>
          </div>
        </div>
        <div id="percentage">
        <div class="form-group">
          <label for="inputAutoloadPercentage" class="col-sm-2 control-label">Percentage</label>
          <div class="col-sm-10">
            <select name="autoload_percentage" class="form-control" id="inputAutoloadPercentage">
{foreach $percentages item=row}
              <option value="{$row}"{if $autoload_type eq 'percentage' && $autoload_value eq $row} selected{/if}>{$row}%</option>
{/foreach}
            </select>
          </div>
        </div>
        </div>
        <div id="monetary">
        <div class="form-group">
          <label for="inputName" class="col-sm-2 control-label">Monetary Value</label>
          <div class="col-sm-10">
            <input type="text" name="autoload_monetary_value" class="form-control" id="inputName" placeholder="Enter a monetary value"{if $autoload_type eq 'money'} value="{$autoload_value}"{/if}>
          </div>
        </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Update Autoload Settings</button>
          </div>
        </div>
      </form>
    </div>

{include file="footer.tpl"}
