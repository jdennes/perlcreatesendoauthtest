#!/usr/bin/env perl
use Mojolicious::Lite;
use lib 'lib';
use Net::CampaignMonitor;

plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  my $url = Net::CampaignMonitor->authorize_url(
    client_id => $ENV{CREATESEND_CLIENT_ID},
    redirect_uri => $ENV{CREATESEND_REDIRECT_URI},
    scope => 'ViewReports,CreateCampaigns,SendCampaigns'
  );
  return $self->redirect_to($url);
};

get '/exchange_token' => sub {
  my $self = shift;
  my $response = 'TODO: Exchange token.';
  $self->render(text => $response);
};

app->start;
