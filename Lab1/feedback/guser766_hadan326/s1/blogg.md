# Seminarie 1: Introduktion till Ruby

Mycket  av det som vi har arbetat med i uppgifterna har vi sett innan och syntaxen var inte svår att komma underfund med. Även om syntaxen inte såg ut som tidigare språk som vi har arbetat med bygger det på samma principer. Det som kanske var nytt var iteratorerna, trots det så kändes det som att det inte var svårt att förstå i de uppgifterna som vi gjorde. För att lösa uppgifterna och lära oss ruby har vi använt oss av den informationen vi fått på föreläsningen samt googlat på vissa delar. Om man jämför med tidigare programmeringsspråk som vi arbetat med märkte vi att det inte fanns lika mycket information på internet men det finns ändå mycket att läsa om ruby trots det.
Vi arbetade genom att skriva vår kod först och efter det gjorde vi våra tester. Att skriva testerna skiljde sig inte mycket den tidigare kursen och därför var det inte något större problem med att få det att fungera. Det var ett smidigt sätt att testa koden. Det kändes som att våra testfall var väl genomtänkta och testar alla möjliga kombinationer av exempelfall.
Ruby kändes som ett väldigt smidigt språk att arbeta med, detta var inte enbart tack vare den lätta syntaxen. Övriga detaljer underlättat för oss är att det kompilerar väldigt enkelt och har syntax och formatteringsstöd hos både VSCode och Emacs. Om man jämför med både c++ och python så var de språken mer strikta med hur det ska vara skrivet för att koden så köra.

Vi har använt många källor utöver ruby-doc för att lära oss om ruby och lösa uppgifterna eftersom det länkas till mängder av hemsidor när vi använder google. Exempel på källor är geeksforgeeks.org, stackoverflow.com och medium.com.

Vi har arbetat med seminarieuppgifterna under det första labbpasset. Under det andra labbpasset gjorde vi testfall och skrev utvecklingsblogg. Eftersom det var första gången vi båda arbetade med Ruby så behövde vi självklart googla en del för att lära oss syntax.

Uppgifterna var ganska väl beskrivna och om något var oklart kunde vi titta på körexemplena. I avsnitt 2 blev vi dock lite fundersamma på vad som menades med “virtuellt attribut” och vad syftet med en sådan datastruktur skulle vara. Vi löste uppgiften med hjälp av vanliga get och set-funktioner.

Uppgifterna var för det mesta lätta att lösa men det fanns också en del som var mer utmanande. De uppgifter som handlade om strängar och sträng-manipulation var relativt lätta eftersom de liknade uppgifter från tidigare kurser. Den svåraste uppgiften var den som handlade om att utöka Integer-klassen så att den fick en funktion som beräknade sitt Fibonacci-nummer.
Första utmaningen var att få tillgång till numrets interna värde, detta gjordes med hjälp av to_int-funktionen som fanns inbyggd i Integer-klassen. Hur funktionen skulle anropas rekursivt var inte heller helt självklart. När vi arbetat med rekursiva funktioner i tidigare kurser så har input-parametrar använts för att hantera data, eftersom funktionen låg i samma klass som själva numret behövdes inga parametrar i uppgiften. När vi sedan skulle expandera String-klassen med funktionen acronym så var det ganska enkelt eftersom vi kunde kopiera mycket från Fibonacci-uppgiften.
Efter att vi tittat mer på dokumentation för Integer-klassen byttes to_int ut mot “self” vilket gjorde koden mer lättläst.

I avsnitt 2 stötte vi på utmaningen att importera externa klasser eftersom vi behövde veta det nuvarande året för att beräkna födelseåret utifrån parametern “age”. Detta var relativt enkelt eftersom google snabbt levererade lösningen och Time-objektet hade en inbyggd funktion för att omvandla till årtal.
I avsnitt 4 som handlade om regex blev vi bekanta med rubys inbyggda funktioner för strängar. Funktionerna sub, gsub, scan och split användes bland annat för att lösa uppgifterna, dessa var lätta att använda eftersom de liknade funktionerna som fanns i python och c++. Array-funktionen map() användes på uppgift 11 för att göra ytterligare regex-operationer på varje element. Detta behövdes eftersom de html-taggar hade hämtats med regexet i scan-funktionen innehöll oönskade tecken i början och slutet.

Under arbetet har vi i gruppen bestämt att använda oss av parenteser efter funktionsanrop trots att det inte är ett krav i ruby. Det gjorde koden lättare att förstå då man t.ex. inte tror att det är en vanlig medlemsvariabel när en funktion anropas.



Pratar om allt på en ytlig nivå, hade gärna sett lite fler exempel.
T ex konkreta jämförelser/skillnader de tänkt på från tidigare språk
Hade velat se en tydlig beskrivning/tolkning av varje uppgift
T ex, "vi tänker att fib ska hantera negativa tal på det här sättet"
Ni hade kunnat reflektera över för/nackdelar med att det fungerar på ett visst sätt, t ex att man inte behövde kalla på self i uppgift 8
