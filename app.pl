#!/usr/bin/env perl
use Mojolicious::Lite;
use lib 'lib';
use Net::CampaignMonitor;
use Data::Dumper;

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
  my $code = $self->param('code');
  
  my $token_details = Net::CampaignMonitor->exchange_token(
    client_id => $ENV{CREATESEND_CLIENT_ID},
    client_secret => $ENV{CREATESEND_CLIENT_SECRET},
    redirect_uri => $ENV{CREATESEND_REDIRECT_URI},
    code => $code
  );

  my $response = "<pre>";
  $response .= "Your user is successfully authenticated. Here are the details you need:<br/><br/>";
  $response .= "access token: ".$token_details->{access_token}."<br/>";
  $response .= "refresh token: ".$token_details->{refresh_token}."<br/>";
  $response .= "expires in: ".$token_details->{expires_in}."<br/>";
  $response .= "<br/><br/>";

  my $cm = Net::CampaignMonitor->new(
    access_token => $token_details->{access_token},
    refresh_token => $token_details->{refresh_token}
  );
  my $clients = $cm->account_clients();

  $response .= "We've made an API call too. Here are your clients:<br/><br/>";
  $response .= Dumper($clients->{response});
  $response .="</pre>";
  
  $self->render(text => $response);
};

app->start;
