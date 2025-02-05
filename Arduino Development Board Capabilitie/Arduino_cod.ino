#include <Dhcp.h>
#include <Dns.h>
#include <Ethernet.h>
#include <EthernetClient.h>
#include <EthernetServer.h>
#include <EthernetUdp.h>

#include <SPI.h>
#include <Ethernet.h>
byte mac[] = {
 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress ip(10,129,0,25);
// Initializarea bibliotecii Ethernet server
// cu adresa IP si portul dorit
// (port 80 este “default” pentru HTTP):
EthernetServer server(80);
String readString;
void setup() {
 // Deschide canal serial:
 Serial.begin(9600);
 while (!Serial) {
 ; // asteapta sa se deschida; doar pentru placa Leonardo
 }
 pinMode(13, OUTPUT);
 Ethernet.begin(mac, ip); // porneste conexiunea Ethernet si serverul:
 server.begin();
 Serial.print("serverul este la ");
 Serial.println(Ethernet.localIP());
}
void loop() {
 EthernetClient client = server.available(); // asculta apelul clientilor
 if (client) {
 Serial.println("client nou");
 boolean currentLineIsBlank = true; // o cerere http se sfarseste cu o linie goala
 while (client.connected())
 {
 if (client.available())
 {
 char c = client.read();
 if (readString.length() < 100) {
 readString += c; //stocheaza caracterele in string
 //Serial.print(c);
 }
 Serial.write(c);
 // daca ai ajuns la sfarsitul liniei (receptionezi caracterul newline)
 // si linia este goala, cererea http s-a sfarsit,
 // deci poti sa trimiti un raspuns
 if (c == '\n' && currentLineIsBlank)
 {
 // trimite un header standard HTTP
 client.println("HTTP/1.1 200 OK");
 client.println("Content-Type: text/html");
 client.println("Connection: close");
 client.println();
 client.println("<!DOCTYPE HTML>");
 client.println("<html>");
 // adauga un meta tag de refresh pentru ca
 //browserul sa resolicite pagina la fiecare 5 secunde:
 //client.println("<meta http-equiv=\"refresh\" content=\"5\">");
 // trimite valoarea fiecarui canal analogic
 for (int analogChannel = 0; analogChannel < 6; analogChannel++)
 {
 int sensorReading = analogRead(analogChannel);
 client.print("intrarea analogica ");
 client.print(analogChannel);
 client.print(" este ");
 client.print(sensorReading);
 client.println("<br />");
 }
 client.println("<a href=\"/?lighton\"\">Aprinde LED</a>");
 client.println("<a href=\"/?lightoff\"\">Stinge LED</a><br />");
 client.println("</html>");
 break;
 }
 if (c == '\n')
 {
 // incepi o noua linie
 currentLineIsBlank = true;
 }
 else if (c != '\r')
 {
 // ai primit un caracter pe noua linie
 currentLineIsBlank = false;

 }
 // Serial.println(readString);
 ///////////////////// controlul LED-ului de pe arduino
 if(readString.indexOf("?lighton") >0)//verifica “Aprins
 {
 digitalWrite(13, HIGH); // pune bitul 13 pe HIGH
 Serial.println("Led Aprins");
 //Serial.println(readString);
 readString="";
 }
 else{
 if(readString.indexOf("?lightoff") >0)//verifica pentru stins
 {
 digitalWrite(13, LOW); // pune bitul 13 pe LOW
 Serial.println("Led Stins");
 //Serial.println(readString);
 readString="";
 }
 }

 }
 }
 // timp necesar pentru ca browserul sa receptioneze data
 delay(1);
 // inchide conexiunea:
 client.stop();
 Serial.println("client deconectat");
 readString="";
 }
}