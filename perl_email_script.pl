#!/usr/bin/perl
#make this executable -> chmod u+x testEmail.pl
use MIME::Entity;

$Y=100;
$X=1;
$random = int( rand( $Y-$X+1 ) ) + $X;
$random;

$message = MIME::Entity->build(
  Type    => "multipart/mixed",
  From    => "cnt\@cntmedia.com",
  To      => "chimmychang\@yahoo.com",
  Subject => "This is a test email from perl - Test Number $random - $timeStamp" );

$message->attach(Data=>"This is a test email from perl - Here is Test Number $random $timeStamp- ");

$message->attach(
  Path     => "./gmailBackup.zip",
  Type     => "application/x-zip",
  Encoding => "base64");

open MAIL, "| /usr/sbin/sendmail -t -oi";
$message->print(\*MAIL);
close MAIL;