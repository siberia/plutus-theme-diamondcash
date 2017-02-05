{*
 * Common header for the Diamond Cash theme
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="Jacques Marneweck // www.leopardrock.com">
    <meta name="copyright" content="2014-2017 Jacques Marneweck and Timothy Colman.  All rights strictly reserved.">
    <meta name="licensee" content="Transaction Africa Platform (Pty) Ltd.">
    <meta name="csrf-token" content="{$csrf_token}">
    <meta name="csrf-param" content="{$csrf_key}">

    <title>Diamond Cash &mdash; Your Money Matters &mdash; {$title}</title>
{include file="_partials/header-bsfa.tpl"}
    <link href="/css/diamondcash.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Roboto" rel="stylesheet">
    <link type="text/plain" rel="author" href="/humans.txt">

{include file="_partials/header-shims.tpl"}
  </head>
  <body>
    <div class="container">
      <div class="header hidden-print">
        <ul class="nav nav-pills pull-right">
          <li{if $nav == "accounts"} class="active"{/if}><a href="/accounts">Accounts</a></li>
          <li{if $nav == "transfer"} class="active"{/if}><a href="/transfer">Transfer</a></li>
          <li{if $nav == "beneficiaries"} class="active"{/if}><a href="/beneficiaries">Pay Beneficiary</a></li>
{if $globals.features.prepaid}
          <li class="dropdown{if $nav == "prepaid"} active{/if}">
            <a class="dropdown-toggle"
              data-toggle="dropdown"
              href="#">
              Prepaid
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><a href="/prepaid/airtime">Airtime</a></li>
              <li><a href="/prepaid/electricity">Electricity</a></li>
            </ul>
          </li>
{/if}
{if $globals.features.sms}
          <li{if $nav == "sms"} class="active"{/if}><a href="/sms">SMS</a></li>
{/if}
{if $smarty.session.show_biztools}
          <li class="dropdown">
            <a class="dropdown-toggle"
              data-toggle="dropdown"
              href="#">
              My Biz Tools
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
{if in_array($smarty.session.user_id, $globals.admins)}
          <li><a href="/agency"><i class="fa fa-pie-chart"></i> Agency</a></li>
{/if}
{if $globals.features.debitorders}
              <li{if preg_match("!\/debitorders?.+!", $smarty.server.REQUEST_URI)} class="active"{/if}><a href="/debitorders">Debit Orders</a></li>
{/if}
{if $globals.features.payrolls}
              <li{if preg_match("!\/payrolls?.+!", $smarty.server.REQUEST_URI)} class="active"{/if}><a href="/payrolls">Payrolls</a></li>
{/if}
            </ul>
          </li>
{/if}
          <li class="dropdown{if preg_match("!\/settings?.+!", $smarty.server.REQUEST_URI)} active{/if}">
            <a class="dropdown-toggle"
              data-toggle="dropdown"
              href="#">
              Settings
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><a href="/settings">Change Password</a></li>
{if $smarty.session.show_autoload}
              <li><a href="/settings/autoload">Autoload Settings</a></li>
{/if}
              <li><a href="/settings/tfa">Two Factor Authentication</a></li>
            </ul>
          </li>
{if in_array($smarty.session.user_id, $globals.admins)}
          <li class="dropdown">
            <a class="dropdown-toggle"
              data-toggle="dropdown"
              href="#">
              Tools
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
{/if}
{if $smarty.session.is_agent}
          <li><a href="/agent"><i class="fa fa-wrench"></i> Agent</a></li>
{/if}
{if in_array($smarty.session.user_id, $globals.admins) || in_array($smarty.session.user_id, $globals.callcenter)}
          <li><a href="/callcentre"><i class="fa fa-headphones"></i> Call Centre</a></li>
{/if}
{if $smarty.session.is_admin}
          <li><a href="/admin"><i class="fa fa-cogs"></i> Basecamp</a></li>
{/if}
{if in_array($smarty.session.user_id, $globals.admins)}
            </ul>
{/if}
          </li>
          <li><a href="/logout"><i class="fa fa-sign-out"></i> Logout</a></li>
        </ul>
        <h3 class="text-muted"><img src="/images/brands/diamondcash.jpg" alt="Diamond Cash Card" height="100"></h3>
      </div>

      <hr />

{if $smarty.session.fica_status eq 0}
    <div class="alert alert-info">Please provide a certified copy of your ID before you are able to start transacting on the Diamond Cash system.  Call centre: 0861 113 673.</div>
{/if}
