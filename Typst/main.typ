#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl

#let main = [

= Einleitung

#v(-2.5em)

== Motivation
Auf Basis des Fundaments von #cite(<shannon1948mathematical>, form: "prose") und der Forschung von #cite(<Vaswani2017SelfAttention>, form: "prose") zu neuronalen Netzen, welche kontextabhängige Informationen aus komplexen Eingaben nutzen können, um korrekte Modellausgaben zu generieren, ist ein neues Zeitalter von #acr("KI"), auf Englisch als #acr("AI") bekannt, eingetreten. Diese Entwicklungen führten zu erheblichen Fortschritten in der Integration von #acr("AI")-Technologien in vielfältige Anwendungsfelder, insbesondere in betriebswirtschaftliche Prozesse #cite(<srivastava2024medpromptextract>, supplement: "S. 8-9"). In der Unternehmenswelt eröffnet der Einsatz von #acr("AI") signifikante Potenziale zur Effizienzsteigerung und Automatisierung ehemals manueller Aufgaben #cite(<McKinsey2023EconomicAI>).

SAP SE nutzt #acr("AI") in der SAP Business #acr("AI") Produktreihe, welche KI-gestützte Lösungen bereitstellt, die sich nahtlos in Geschäftsprozesse einfügen #cite(<sap2024BAIProducts>). Ein Anwendungsfeld stellt die Datenextraktion dar, die aus unstrukturierten Datenquellen strukturierte Daten gewinnt. Diese können zur Automatisierung manueller Prozesse genutzt werden #cite(<Sarawagi2008IE>, supplement: "S. 263-264"). SAP arbeitet daran, aufwendige interne Prozesse mittels strukturierter Datenextraktion zu automatisieren
  #cite(<sap2025ConcurAI>).

Der Verkauf sowie die Integration, auch als Aktivierung bezeichnet, der Business #acr("AI")-Produkte bei Kunden gehören zu den Hauptzielen der SAP im Jahr 2025
  #cite(<SAP2025AIThemes>). 
Zur Messung der Erreichung dieses Ziels sind Reportingdaten notwendig, welche die Anzahl der erfolgreichen Aktivierungen dokumentieren. Durch das steigende Interesse von Kunden an SAP Business #acr("AI")-Produkten arbeitet die #acr("AI") #acr("RIG"), die für die Aktivierung von Business #acr("AI") zuständige Beratungsgruppe der SAP, unter erhöhtem Druck
  #cite(<McKinsey2023EconomicAI>). 
Um sich auf wertschöpfende Aktivitäten für die Kunden zu fokussieren, soll ein Ansatz entwickelt werden, mittels der Anwendung von #acr("AI") aus E-Mails strukturierte Reportingdaten auszulesen und diese automatisiert in das #box([Reporting der #acr("RIG") einzupflegen.])

== Ziel und Gang <ZielUndGang>
Ziel dieser Arbeit ist eine Automatisierung des #acr("RIG") Reportingprozesses. Hierzu wird ein Ansatz der Automatisierung entwickelt, als #acrf("PoC") #box([implementiert]) und hinsichtlich seiner #box([Qualität evaluiert.])

Der aktuelle Reportingprozess basiert auf der manuellen Extraktion von Reportingdaten aus E-Mails sowie deren Übertragung in eine interne Reporting-Anwendung. Aufgrund seiner repetitiven Natur soll ein automatisierter Ansatz erprobt werden, welcher strukturierte Reportingdaten mittels #acr("AI")-gestützter Datenextraktion erfasst, und automatisiert in das Reporting überführt. Dies sieht sowohl eine Entlastung der AI RIG als auch eine verbesserte Informationsgrundlage für strategische Entscheidungen der SAP vor. Folgende Forschungsfragen an die Automatisierung des Reportingprozesses der #acr("RIG") werden gestellt:


// Der bisherige Reportingprozess erfordert das manuelle Extrahieren von Reportingdaten aus E-Mails und Setzen innerhalb des internen Reporting-Anwendung. Da diese Aufgabe zeitintensiv und repetitiv ist, soll ein #acr("KI")-gestützter Ansatz der Datenextraktion strukturierter Daten erprobt werden, welche den aktuellen Status einer Kundenaktivierung automatisiert in der internen Reporting-Anwendung einpflegt. Dies bedeutet eine Zeitersparnis für die #acr("RIG") sowie einer fundierten Informationsbasis für strategische Entscheidungen der SAP.
- *Forschungsfrage 1*: Wie kann der Reportingprozess der #acr("RIG") mithilfe von Automatisierung durch #acr("AI") verbessert werden?
// - *Forschungsfrage 2*: Welche Verfahren der Datenextraktionsoptimierung aus der Literatur zeigen eine verbesserte Datenextraktionsgenauigkeit?
- *Forschungsfrage 2*: Welche Modellwahl und Prompting-Techniken haben einen positiven Einfluss auf die Genauigkeit von E-Mail-Extraktionsaufgaben?
// - *Forschungsfrage 2*: Wie kann eine erfolgreiche Datenextraktion den zugehörigen Eintrag in der Reporting-Anwendung identifizieren?

Die methodische Grundlage bildet das #acr("CRISP-DM")-Modell. Nach einer Einführung in die Prozesse der #acr("RIG"), eingesetzte Tools sowie relevante theoretische Konzepte in @Grundlagen werden in @Praxis die Phasen von #acr("CRISP-DM") zur Entwicklung des #acrpl("PoC") durchlaufen. Eine abschließende Betrachtung erfolgt in @Schlussbetrachtung.

// Zur Beantwortung der Fragen wird #acr("CRISP-DM") als grundlegende Methodik angewendet. Nach einer Einführung in den Prozess der #acr("AI") #acr("RIG"), verwendete Anwendung sowie notwendige theoretische Kenntnisse werden die Phasen von #acr("CRISP-DM") zur Entwicklung eines Prototypen durchlaufen und Erkenntnisse in Form dieser Arbeit dokumentiert.

= Methodik
Um den Reportingprozess der #acr("RIG") durch strukturierte E-Mail-Kommunikationsdatenextraktion zu verbessern und deren Genauigkeit zu steigern, wird in dieser Arbeit der #acr("CRISP-DM")-Prozess als methodischer Rahmen verwendet. #acr("CRISP-DM") hat sich seit seiner Einführung als De-facto-Standard für Data-Mining-Projekte etabliert und bietet einen bewährten, strukturierten Ansatz für die Durchführung von Datenextraktionsprojekten
  #cite(<schroer2021systematic>, form: "normal", supplement: "S. 529-532")
  #cite(<oliveira2002text>, supplement: "S. 10")
  #cite(<choudhry2022data>, supplement: "S. 4-5").
Da es sich bei dieser Arbeit um die Entwicklung eines #acr("PoC") handelt, werden Kriterien festgelegt, anhand derer entschieden wird, ob eine Produktivnahme des #acr("PoC") aussteht oder welche Schritte für eine produktive Implementierung ausstehen.

Zur Datenextraktion werden #acrfpl("PLM") verwendet. #acrpl("PLM"), Teilgruppe der #acrfpl("LLM"), sind vortrainierte Modelle, welche auf großen Datenmengen vortrainiert sind und hinsichtlich Datenextraktionsaufgaben in anderen Domänen herkömmliche regelbasierte und statistische #acr("NLP")-Ansätze in Genauigkeit übertreffen
  #cite(<Wang2024>, supplement: "5167-5171").
Darüber hinaus kann mittels Optimierungsverfahren ihre Extraktionsgenauigkeit weiter gesteigert werden kann 
  #cite(<yang2022information_extraction>, supplement: "S. 1-4").
In der Medizin findet #acr("PLM")-basierte Datenextraktion aus Freitexten bereits Anwendung und weist hohe Genauigkeiten auf
  #cite(<adamson2023ml_ehr>, form: "normal", supplement: "S. 5-7")
  #cite(<srivastava2024medpromptextract>, form: "normal", supplement: "S. 6-9").
Durch ihre hohe Genauigkeit der Datenextraktion in vergleichbaren Domänen werden in dieser Arbeit #box([#acrpl("PLM") eingesetzt
  #cite(<labonne2023spamT5>, supplement: "S. 11-14").])

Im Rahmen des #acr("PoC") wird ein Experiment durchgeführt, um verschiedene Modellierungsansätze zu testen und deren Auswirkung auf die Datenqualität zu messen und zu validieren
  #cite(<pu2023summarization>, supplement: "S. 1-3").
Hierzu werden vorab auf Literatur basierte Hypothesen getroffen und diese anhand von Evaluationsmetriken als "angenommen", "teilweise angenommen" und "abgelehnt" klassifiziert. Durch gezielte Variation von #acrpl("LLM") und Prompting-Techniken können die Auswirkungen auf die Qualität der Datenstrukturierung systematisch untersucht werden und die für den Anwendungsfall besten Konfigurationen ausgewählt werden
  #cite(<saltz2017datascience>, supplement: "S. 1014-1016").

Zur Bewertung der Ergebnisse werden die Metriken Precision, Recall, F1-Score sowie #acr("ROUGE") eingesetzt, da sie sowohl exakte als auch Teilübereinstimmungen mit einer Referenzquelle quantitativ erfassen #cite(<Hu2024LLMEvaluation>, supplement: "S. 6-12"). Die Auswahl dieser Metriken ergibt sich durch die Varianz der zu extrahierenden Felder, die Klassifikationen und Freitextanteile enthalten, wodurch eine ganzheitliche Evaluierung der Datenextraktionsqualität ermöglicht wird #cite(<Hein2025>, supplement: "S. 8") #cite(<Lin2004>, supplement: "S. 1-2"). Als Referenzquelle werden manuell extrahierte Daten auf Basis eines reduzierten Datensatzes verwendet. Sämtliche genannte Metriken sind in der Literatur etabliert und finden Anwendung bei #acr("LLM")-gestützten Datenextraktionen in #box([vergleichbaren Anwendungsbereichen #cite(<Ghamrawi2005CollectiveMLC>, supplement: "S. 5") #cite(<Li2024LLMJudge>, supplement: "S. 2-3").])

= Grundlagen <Grundlagen>
Im Folgenden werden theoretische Grundlagen erläutert, die für ein tieferes Verständnis in den Folgekapiteln vorausgesetzt werden.

== AI Regional Implementation Group <RIG>
Die SAP #acr("AI") #acrf("RIG") ist eine Beratungsgruppe der SAP, die Kunden bei der Aktivierung ihrer SAP Business AI unterstützt. Ihre Aufgaben sind dabei die Analyse der Kundenlandschaft, die Identifizierung von #acr("AI")-Szenarien und die Begleitung während der Aktivierung 
  #cite(<sap2025rig>, supplement: "S. 5"). 
Wie aus @RIGPhases ersichtlich unterstützt die #acr("RIG") in der "Discover" bis hin zur "Realize" Phase Kollegen aus dem Sales und dem Support.

#figure(caption: "Abstrahierte Prozesse in der RIG AI in Anlehnung an " + cite(<RIG2025processes>), image("pictures/RIG_Process.png", width: 100%))<RIGProcess>

Jeder Kunde, der Interesse am Zukauf von SAP Produkten hat, wird in SAP Systemen als "Opportunity" abgebildet und von einem zugewiesenen Betreuer aus dem SAP Customer Team, meist einem #acr("AE"), betreut. Eine Opportunity enthält Kundendaten sowie das Produkt, an dem der Kunde Interesse hat. Hat dieses #acr("AI")-Bezug, wird über die #acr("MXP") die Opportunity der #acr("RIG") zur Verfügung gestellt. Der technische Prozess wird in @MXP vertieft.
  #cite(<RIG2025processes>, supplement: "S. 9-14")
  [@RIGProcess, Prozess 1]

Sobald der Kunde den Kaufvertrag unterschrieben hat, tritt die #acr("RIG") mittels einer Kundenmailkampagne mit dem zuständigen #acr("AE") in Kontakt und ergänzt für die Verarbeitung notwendige Daten im #acr("RIG")-#acr("MXP"). Sobald diese in der Opportunity ergänzt wurden, wird der Kunde bei der Aktivierung der gekauften #acr("AI")-Produkte unterstützt und der Prozess der Aktivierung im #acr("MXP") #box([aktuell gehalten.
  #cite(<sap2025rig>, supplement: "S. 8")
  [@RIGProcess, Prozess 2-3]])

Nach dem erfolgreichen Abschluss der Aktivierung werden fehlende Daten in einer Reporting-Anwendung, gehostet über die #acr("MXP"), ergänzt und der Status der Opportunity auf "Activated" gesetzt. Anschließend werden die aggregierten Daten aller abgeschlossener Opportunities dem Management zur #box([Verfügung gestellt
  #cite(<RIG2025processes>, supplement: "S. 9-14")
  [@RIGProcess, Prozess 4].])

#pagebreak()
#v(-2em)
== Cross Industry Standard Process for Data Mining
#acr("CRISP-DM") ist ein De-facto-Standard Vorgehensmodell, um Data-Science- und Data-Mining-Projekte strukturiert zu planen und durchzuführen #cite(<schroer2021systematic>, supplement: "S. 529-532")#cite(<Martinez-Plumed2020CRISPDM>, supplement: "S. 2"). Der #acr("CRISP-DM")-Prozess ist industrie- und technologieunabhängig konzipiert und in sechs Phasen unterteilt, die von der geschäftlichen Zieldefinition bis zur finalen Implementierung reichen #cite(<Chapman2000CRISPDM>, supplement: "S. 9-10"). Das Vorgehensmodell gliedert sich in die in @CrispDmPhasen dargestellten Phasen und wird im Folgenden erläutert:

#figure(caption: "Phasen des CRISP-DM Prozess " + cite(<Wirth2000CRISPDMTA>, form: "normal"), image("pictures/CRISP-DM.png", width: 70%))<CrispDmPhasen>

- *Business Understanding:* In der ersten Phase werden Ziele aus Unternehmensperspektive definiert und die Anforderungen an das Data-Science-Projekt präzisiert #cite(<Chapman2000CRISPDM>, supplement: "S. 16-19"). Dazu werden ein oder mehrere Erfolgskriterien zur Bewertung der Zielerfüllung ausgewählt #cite(<schroer2021systematic>, supplement: "S. 527").

- *Data Understanding*: In dieser Phase werden zur Verfügung stehende Datenquellen identifiziert, Daten gesammelt und erste Analysen durchgeführt, um einen Überblick über Datenqualität, Datenumfang sowie Hinweise zu Datenanalysemethoden #box([zu erlangen. #cite(<Chapman2000CRISPDM>, supplement: "S. 20-22")])

- *Data Preparation*: In Phase Drei wird aus dem rohen Datensatz ein zur Modellierung geeigneter Datensatz geschaffen. Dazu gehört die Selektierung, Säuberung, Ergänzung von Attributen und Einträgen, Transformation und Konvertierung in ein geeignetes Format. #cite(<Chapman2000CRISPDM>, supplement: "S. 23-26")

- *Modelling*: In der vierten Phase werden für den Geschäftskontext geeignete Modellierungstechniken ausgewählt, angewendet und für die Evaluation der Ergebnisse relevante Metriken bestimmt. #cite(<Chapman2000CRISPDM>, supplement: "S. 27-29")

- *Evaluation*: In dieser Phase wird das Modelling und die Ergebnisse anhand der Evaluationsmetriken bewertet und evaluiert, inwiefern die in Business Understanding definierten Ziele erreicht sind. #cite(<Chapman2000CRISPDM>, supplement: "S. 30-31").

- *Deployment*: Nach der erfolgreichen Erfüllung aller Ziele erfolgt die Planung und Durchführung der Produktivnahme (Deployment), Projektabschluss und Dokumentation. Hierbei werden die Verantwortungen nach Ende des Projektes hinsichtlich Wartung und Support festgehalten. #cite(<Chapman2000CRISPDM>, supplement: "S. 32-34")

Die Verwendung von #acr("CRISP-DM") bringt einige Vorteile mit sich. #acr("CRISP-DM") erlaubt eine Iteration in vorherige Phasen [@CrispDmPhasen], beispielsweise durch von den Geschäftszielen abweichende Datengrundlage
  #cite(<IBM2023CRISPDM>, supplement: "S. 9"),
Notwendigkeit weitere Datenvorverarbeitung oder Nichterfüllung der Geschäftsziele in der Evaluation
  #cite(<dean2023crisp_dm>, supplement: "Abs. 2.1").
Erkenntnisse aus den vorherigen Iterationen fließen in den Prozess mit ein und verbessern die Datenqualität und #box([Modellleistung nachhaltig
  #cite(<Chapman2000CRISPDM>, supplement: "S. 9-10").])

Zudem bietet CRISP-DM eine Struktur, die sich sowohl zur alleinigen Arbeit als auch in einem Team eignet. Durch ihren Status als De-facto-Standard Vorgehensmodell für Data Mining Projekte ist sie vielen Data Scientists bekannt
  #cite(<schroer2021systematic>, supplement: "S.")
und unterstützt diese dabei, Kommunikationsaufwand zu reduzieren und Verantwortlichkeiten zu klären 
  #cite(<schroer2021systematic>, supplement: "S. 529").
Die frühzeitige Einbindung von Geschäftszielen stellt sicher, dass das Projekt relevant ist.

Allerdings birgt #acr("CRISP-DM") Risiken bei der Anwendung. Die zuvor beschriebene Iterativität wird in der Praxis oft nicht gelebt und Phasen werden linear durchlaufen
  #cite(<Baijens2020ScrumDS>, supplement: "S. 32")
  #cite(<Wirth2000CRISPDMTA>, supplement: "S. 7-8"). 
Gründe dafür sind fehlende Richtlinien, wann eine Iteration in eine vorherige Phase notwendig ist
  #cite(<Baijens2020ScrumDS>, supplement: "S. 32-33"). 
Zudem setzt #acr("CRISP-DM") keinen Fokus auf Projektmanagement, wodurch es in der Praxis zu Abweichung von Phasen- und Zielen kommen kann und Fristen nicht eingehalten #box([werden können
  #cite(<Wirth2000CRISPDMTA>, supplement: "S. 7-8")
  #cite(<Baijens2020ScrumDS>, supplement: "S. 32-33").])

#acr("CRISP-DM") setzt zudem einen klaren Fokus auf Datenanalyse und Modellentwicklung, wobei nur eine geringe Anzahl der Modelle am Ende des #acr("CRISP-DM")-Zyklus produktiv entwickelt werden. Gründe dafür sind fehlende Standards zu Wartung & Kontrolle nach Evaluation des Modells. Viele der Modelle werden im Anschluss mittels einer anderen Methodik produktiv implementiert.
  #cite(<schroer2021systematic>, supplement: "S. 532-533")

In dieser Arbeit wird #acr("CRISP-DM") als methodischer Rahmen verwendet, da der Fokus auf Datenanalyse und Modellentwicklung den Anforderungen des Projektes entspricht und Projektmanagementaspekte aufgrund der Einzelentwicklung des #acr("PoC") zweitrangig sind. Zudem ist die Methodik als De-facto-Standard im Team der #acr("AI") #acr("RIG") etabliert, wodurch eine spätere Übergabe zur Produktivnahme des #acr("PoC") effizient erfolgen kann, wobei diesen das Risiko eines fehlenden Projektmanagement bekannt ist.

#pagebreak()
#v(-2em)

//! Hier weiterschreiben
== Large Language Models <llm_grundlagen>
#acrfpl("LLM") sind generative Sprachmodelle, die aus einer Modelleingabe (Prompt) anhand von Wahrscheinlichkeiten eine natürliche Ausgabe produzieren
  #cite(<Zhao2023>, supplement: "S. 2"). 
Sie entspringen der Domäne des #acr("NLP") und basieren in der Regel auf neuronalen Netzen, die auf großen Datensätzen trainiert werden
  #cite(<Bommasani2021>, supplement: "S. 3"). 
Ein neuronales Netz verbindet Eingabe- und Ausgabedaten über künstliche Neuronen, welche die Aufgabe haben, aus mehreren Eingaben, anhand von Wahrscheinlichkeiten (Bias) aus vorherigen Iterationen, eine Ausgabe zu berechnen. Die Ausgaben werden anschließend von einer Softmax-Funktion, welcher einer Eingabe eine Ausgabewahrscheinlichkeit zuweist
  #cite(<Du2025temperature>, supplement: "S. 1"),
bewertet und die Antwort (Prediction) mit der höchsten #box([Wahrscheinlichkeit ausgibt.
  #cite(<Lapedes1988>, supplement: "S. 442-443").])
// Neben dem Prompt können Hyperparameter wie bspw. die Modelltemperatur in das Modell gegeben werden, um das Bias des Modells zu manipulieren. Die Temperatur eines #acrpl("LLM") beeinflusst die Softmax Funktion des #acrpl("LLM"), inwiefern sich dieses an errechneten Wahrscheinlichkeiten möglicher Wortvorstellungen orientiert. Bei hoher #acr("LLM")-Temperatur flacht die Softmax Funktion des Modells ab, wodurch das Modell "kreative", aber zunehmend inkohärente Daten ausgibt, wobei es bei einer niedrigen Temperatur deterministischer arbeitet [@TempCurve]
//   #cite(<Du2025temperature>, supplement: "S. 1"). 

// #figure(caption: "Temperaturverhalten von LLMs anhand eines Beispiels " + cite(<hopsworks_llm_temperature>, form: "normal"), image("pictures/temperature_example.png"))<TempCurve>

Eine Vielzahl von #acrpl("LLM") basieren auf Transformer-Architektur, die mithilfe von mehrschichtigen neuronalen Netzen eine Ausgabe auf Basis des Encoder-Decoder-Prinzip produzieren
  #cite(<Hu2024SwitchLLM>, supplement: "S. 2")
  #cite(<Vaswani2017SelfAttention>, supplement: "S. 1-6").
Das Encoder-Decoder-Prinzip trennt die Architektur eines Modells in Encoder und Decoder. Der Encoder wandelt eine Wortsequenz in eine Vektorrepräsentation (Token) um, während der Decoder die durch die Softmax-Funktion wahrscheinlichsten Token transformiert und in natürlicher Sprache ausgibt.
  #cite(<Raffel2019>, supplement: "S. 4-5")
  #cite(<Kamath2024TheBook>, supplement: "S. 31-32").
Zur Generierung des Ergebnisses werden Relationen zwischen Tokens mittels Selbstaufmerksamkeit (Self-attention) extrahiert
  #cite(<Kamath2024TheBook>, supplement: "S. 33"). 
Self-attention bestimmt für jeden Token einen relativen Query-, Key- und Value-Vektor, welche verschiedene Anteile des Tokens repräsentieren
  #cite(<Vaswani2017SelfAttention>, supplement: "S. 6-7").
  #cite(<Raffel2019>, supplement: "S. 6") 
Mit Hilfe dieser Vektoren können auf der Basis von Vektorenaddition und Vektorenabständen kontextuelle Beziehungen zwischen allen Token der Eingabesequenz, sowie gespeicherten Parametertokens abgebildet und auf Basis dieser begründete Voraussagen getroffen werden, welche hinsichtlich Genauigkeit die von regelbasierten Verfahren in diversen Domänen übersteigen
  #cite(<Kamath2024TheBook>, supplement: "S. 34")
  #cite(<wadhwa2023revisiting>, supplement: "S. 15572-15573").

#acrpl("LLM") grenzen sich gegenüber anderen Sprachmodellen besonders durch ihre Modellgröße und umfangreiches Training ab, wodurch sie eine hohe Leistung in diversen Anwendungen aufweisen
  #cite(<Zhao2023>, supplement: "S. 2-3"). 
Es wird differenziert zwischen #acrspl("LLM") und #acrspl("PLM"). #acrpl("PLM") bilden eine Untermenge von #acrpl("LLM") und zeichnen sich durch ein bereits erfolgtes Training des Modells aus, wobei andere Modelle vor der Nutzung trainiert werden müssen, um korrekte Ergebnisse zu produzieren.
  #cite(<Tang2024plmllm>, supplement: "Abs. 1").
In der Literatur werden diese Begriffe häufig synonym genutzt, weswegen in dieser Arbeit die allgemeine Bezeichnung #acr("LLM") #box([verwendet wird
  #cite(<Tang2024plmllm>, supplement: "Abs. 1").
  #cite(<Ge2023>, supplement: "S. 1-3").])

=== Vorteile von Large Language Models
#acrpl("LLM") haben in den letzten Jahren erhebliche Fortschritte in der natürlichen Sprachverarbeitung erzielt und bieten eine Vielzahl von Vorteilen in #box([diversen Domänen.
  #cite(<McKinsey2023EconomicAI>)])

Im Gegensatz zu traditionellen Modellen zeichnen sich #acrpl("LLM") durch ihr natürliches Sprachverständnis aus
  #cite(<Cheung2024>, supplement: "S. 1-2").
Aufgrund ihrer Transformer-Architektur ist es #acrpl("LLM") möglich, die Relationen zwischen Sätzen aufzufassen, wodurch sie in der Lage sind, komplexe Satzstrukturen zu produzieren und eine korrekte Ausgabe zu produzieren
  #cite(<Wu2025>, supplement: "S. 10-11").

#acrpl("LLM") zeichnen sich durch ihre Adaptierbarkeit aus. Durch gezielte Eingaben lassen sich #acrpl("LLM") mit wenigen oder ohne Beispieldaten flexibel auf Anwendungsfälle einstellen 
  #cite(<brown2020language>, supplement: "S. 1").
Im Gegensatz zu regelbasierten #acr("NLP")-Verfahren können #acrpl("LLM") Daten zum kontinuierlichen Lernen verwenden, wodurch ihre Antwortqualität kontinuierlich steigt
  #cite(<Devlin2019>, supplement: "S. 3-4").

Ein weiterer Vorteil ist die Genauigkeit von #acrpl("LLM"). In Extraktions- und Evaluationsaufgaben übertreffen #acrpl("LLM") regelbasierte Verfahren sowohl in Genauigkeit als auch Fehlerrate.
  #cite(<Hu2024SwitchLLM>, supplement: "S. 5-8")
  #cite(<Sawicki2025>, supplement: "S. 8"). 
Im medizinischen Umfeld werden Modelle bereits seit langem eingesetzt und übertreffen Mediziner in diversen Domänen, beispielsweise in der Krebserkennung oder #box([der Datenextraktion
  #cite(<Wan2025>, supplement: "S. 4-8")
  #cite(<VanVeen2023>, supplement: "S. 8-15").])

Ebenso erlauben #acrpl("LLM") die Automatisierung diverser Prozesse, speziell in Unternehmen und der Forschung in Aufgaben wie Textgenerierung oder Zusammenfassung von Informationen
  #cite(<openai2023gpt>, supplement: "S. 1-4").

=== Risiken und Herausforderungen <LLMRisiken>
Dennoch birgt der Einsatz von #acrpl("LLM") Risiken bei ihrer Verwendung gegenüber regelbasierten Verfahren. Ein großes Risiko bilden sogenannte "Halluzinationen". Als Halluzination wird die Generierung von Inhalten, die faktisch falsch sind und keine Grundlage in den Trainingsdaten haben 
  #cite(<ji2023hallucination>, supplement: "S. 4")#cite(<Islam2024>, supplement: "S. 1-3").
Diese können durch diverse Faktoren auftreten. Darunter gehören Fehlberechnungen statistischer Annahmen, unvollständiges Modelltraining oder die Hinzugabe von zu geringem Kontext in das Modell
  #cite(<ji2023hallucination>, supplement: "S. 5"). 
Sie können mit diversen Methoden minimiert, aber nicht vollständig #box([vermieden werden 
  #cite(<Islam2024>, supplement: "S. 11-12")])

Einschränkungen treten bei #acrpl("LLM") hinsichtlich Kosten, Zeit und Daten auf
  #cite(<Shekhar2024OptimizingLLMCosts>, supplement: "S. 1"). 
Lokale #acrpl("LLM") mit Milliarden Parametern erfordern enorme Rechenleistung und spezialisierte Hardware für deren Betrieb, zuzüglich Trainings- und Wartungskosten. Ein lokales Deployment wird bei vielen Unternehmen aus Kostengründen ausgeschlossen. Aus diesem Grund bieten viele Modellhersteller eine Nutzung des Modells über #acrpl("API")-Anfragen an, bei der das Modell vom Anbieter gehostet wird und Kosten auf Basis der Nutzung kalkuliert werden
  #cite(<OpenAI2025Pricing>)
  #cite(<Shekhar2024OptimizingLLMCosts>, supplement: "S. 1-3").
Durch die Verwendung von #acr("API")-Schnittstellen zwischen Modellanbieter und Anwender kommt es zu Latenzen zwischen Eingabe und Modellausgabe
  #cite(<Yang2023Harnessing>, supplement: "S. 15-16").
  #cite(<Waltl2017RuleBasedIE>, supplement: "S. 2").

Die Verwendung von #acrpl("LLM") bringt Datenschutzrisiken mit sich. Sensitive Daten wie Namen, Adressen o.ä. werden bei Eingabe in ein #acr("LLM") zu Trainingszwecken beim #acr("LLM")-Anbieter verwendet
  #cite(<Wang2024ResponsibleLLM>, supplement: "S. 5167"), 
wodurch dem #acr("LLM")-Nutzer bei fehlender Zustimmung durch Herausgabe an Externe Schaden drohen kann
  #cite(<GDPR2016>).

=== Large Language Models in der Datenextraktion <LLMDataExtr>
#acrpl("LLM") haben in der automatisierten Datenextraktion für Wirtschaft und Forschung deutliche Fortschritte ermöglicht. Im Vergleich zu klassischen NLP-Verfahren erreichen #acrpl("LLM") häufig eine höhere Genauigkeit bei der Extraktion strukturierter Informationen aus #box([unstrukturierten Textdaten 
  #cite(<Hu2024SwitchLLM>, supplement: "S. 5-8")
  #cite(<Aguda2024FinancialAnnotators>, supplement: "S. 4-5").])

In der Medizin werden bereits #acrpl("LLM") zur Extraktion von Daten aus unstrukturierten Daten genutzt
  #cite(<tian2024chatgpt>, supplement: "S. 4-7")
  #cite(<Wang2024>, supplement: "S. 5167-5174")
  #cite(<Hein2025>, supplement: "S. 7-12")
und übertreffen bei der Extraktion klinischer Informationen aus Freitext klassische #acr("NLP")-Verfahren 
  #cite(<Hu2024SwitchLLM>, supplement: "S. 5-8").
In der Wirtschaft steigern #acrpl("LLM") in einer Studie zur Extraktion von Finanzdokumenten die Leistung gegenüber manuellen Verfahren um #box([bis zu 29% 
  #cite(<Aguda2024FinancialAnnotators>, supplement: "S. 4").])

Dennoch bringt der Einsatz von #acrpl("LLM") in der Datenextraktion auch Herausforderungen mit sich. Das Problem der Halluzinationen von #acrpl("LLM")  tritt ebenfalls in Extraktionsaufgaben auf, etwa bei der Extraktion nicht vorhandene Beziehungen zwischen Entitäten. Dadurch wird es in der Extraktion sensitiver Geschäftsdaten als zentrales Problem angesehen.
  #cite(<Aguda2024FinancialAnnotators>, supplement: "S. 7-11")
  #cite(<Xu2023GenerativeIE>, supplement: "S. 3").
Darüber hinaus ist die Verwendung von #acrpl("LLM") gegenüber regelbasierten #acr("NLP")-Extraktionsverfahren mit erhöhtem Zeit- und Ressourcenaufwand verbunden, weswegen sie im geschäftlichen Kontext oft nicht in Betracht gezogen werden
  #cite(<Shekhar2024OptimizingLLMCosts>, supplement: "S. 1")
  #cite(<Yang2023Harnessing>, supplement: "S. 15-16")

== Services & Tools

In dieser Arbeit werden diverse Tools und Services zur Realisierung genutzt, die im Folgenden weiter erläutert werden. 

=== SAP Generative AI Hub
Der #acr("GenAI") Hub ist eine zentrale Plattform der SAP, die den Zugang zu generativen #acr("AI")-Modellen über den SAP AI Core ermöglicht
  #cite(<Roth2024>).
Der SAP #acr("AI") Core Service fungiert als zentrale #acr("AI") Laufzeit-Umgebung innerhalb der SAP Business Technology Platform, die zugrunde liegende Cloud-Plattform zur Entwicklung, Integration und Erweiterung von SAP Anwendungen.
  #cite(<SAP2025GenAIHub>, supplement: "S. 59-61").
Der SAP #acr("GenAI") Hub bietet mittels #acr("AI") scenarios eine einheitliche Schnittstelle für diverse #acr("AI")-Modellanbieter, wodurch ein einfaches und ressourcenoptimiertes Wechseln zwischen Modellen möglich ist
  #cite(<SAP2025GenAIHub>, supplement: "S. 59-60")
  #cite(<Roth2024>).
Innerhalb der SAP fallen für die Verwendung des #acr("GenAI") Hub keine Kosten an, Kunden zahlen Lizenzkosten zur Nutzung der Plattform.

Zur Realisierung einer einheitlichen Schnittstelle bietet der SAP #acr("GenAI") Hub den Orchestration Service unter dem #acr("AI") Scenario "orchestration" an. Dieser erlaubt das Nutzen von ausgewählten #acr("AI")-Modellen diverser Anbieter mithilfe einer einheitlichen #acr("API")-Schnittstelle.
  #cite(<SAP_Learning2025>). 

// #figure(caption: "Orchestration Service des SAP GenAI Hub " + cite(<SAP_Learning2025>, form: "normal"), image("pictures/OrchestrationService.png", width: 100%))<OrchestrationService>

#figure(caption: "Orchestration Service des SAP GenAI Hub " + cite(<SAP_Learning2025>, form: "normal"), image("pictures/OrchestrationServiceArch.png", width: 100%))<OrchestrationService>

Der Orchestration Service bietet die in @OrchestrationService dargestellten Funktionen, welche in der Anwendung im Geschäftskontext wichtig sind. Prompt Templating erlaubt das dynamische Einfügen von Attributen in Prompts und Data Masking ermöglicht die Kodierung von vordefinierten Daten bei der Eingabe in ein Modell.
  #cite(<SAP2025GenAIHub>, supplement: "S. 97").
Die Modellausgabe kann nach Verarbeitung wieder encodiert werden. Darüber hinaus stellt der #acr("GenAI") Hub eine einheitliche Implementierung für strukturierte Modellausgaben (bspw. als #acr("JSON")-Format) unter der Funktion "Structured Output" zur Verfügung, welche die Ausgabe in einer vordefinierten Datenstruktur garantiert, die zur Weiterverarbeitung der Daten #box([notwendig ist
  #cite(<Li2024LLMSAP>)
  #cite(<OpenAI2025StructuredOutput>).])

Alle im #acr("GenAI") Hub verfügbaren Modelle entsprechen den Datenschutz- und Sicherheitsanforderungen der SAP SE
  #cite(<Herzig2023>). 
Im Laufe des Jahres 2025 sollen weitere Modelle zum SAP #acr("GenAI") Hub hinzugefügt werden und weitere Funktionen wie Hyperparametertuning ermöglicht werden
  #cite(<SAP2025RoadmapGenAIHub>).
Damit bietet der SAP #acr("GenAI") Hub eine solide Basis für über diese Arbeit hinausgehende Forschung.

#pagebreak()
#v(-2em)
=== SAP Multi Experience Platform <MXP>
Die SAP #acrf("MXP") ist eine Plattform, die Datenverwaltung mit einer Low-Code basierten Entwicklung von Applikationen verbindet
  #cite(<mxp2025documentation>, supplement: "Abs. Introduction").
Sie stellt eine Erweiterung zur SAP Analytics Cloud dar und erlaubt eine Integration mehrerer Datenquellen, deren Anreicherung mit weiteren Daten und anschließende Darstellung der Daten in Form einer Webanwendung
  #cite(<mxp2025documentation>, supplement: "Abs. Introduction")
  #cite(<SAP_MXP_Overview>).
Im Gegensatz zu anderer Anwendung, wie der SAP Datasphere, fokussiert sich die #acr("MXP") auf die Low-Code basierte Entwicklung von Webanwendungen zur Verwaltung und Manipulation aggregierter Daten, wobei eine Analyse der aggregierten Daten zweitrangig ist
  #cite(<SAP_MXP_SolutionOverview>, supplement: "S. 2-4").
#acr("MXP") Applikationen eignen sich für datenintensive Anwendungen, beispielsweise zur Visualisierung von Kennzahlen oder #box([zum Reporting
  #cite(<mxp2025documentation>, supplement: "Abs. Experience Building & Designing").])

// #figure(caption: "Architektur einer MXP Applikation " + cite(<mxp2025documentation>, form: "normal"), image("pictures/aCMS_arch.png", width: 100%))<aCMSarch>

#figure(caption: "Architektur einer MXP Applikation " + cite(<mxp2025documentation>, form: "normal"), image("pictures/aCMSarch.png", width: 100%))<aCMSarch>

Die #acr("MXP") nutzt #acrfpl("aCMS"), um Aufwand bei der Integration mehrerer Datenquellen zur Applikationsentwicklung zu mindern. Das #acr("aCMS") ist ein Datenverwaltungssystem, welches mittels einer Zwischenschicht, dem #acr("MXP") Core Model, Daten aus mehreren Pipelines zusammensetzt und die Anreicherung mit zusätzlichen Daten ermöglicht 
  [@aCMSarch]. 
Diese angereicherten Datensets werden als "Entity" in einer "Worksphere", anwendungsspezifischen Datastores, gespeichert. Auf Entities kann mittels einer #acr("API") zugegriffen werden, welche es erlaubt, die Daten auszulesen und #box([zu bearbeiten.
  #cite(<mxp2025documentation>, supplement: "Abs. Content Management")])

Eine Experience bildet ein interaktives User Interface einer #acr("MXP") Applikation, welches als Webanwendung zur Laufzeit Daten aus dem #acr("aCMS") konsumiert. Sie ruft die Daten einer oder mehrerer Entities per #acr("API")-Call auf und ermöglicht Nutzern die Manipulation der Daten aus dem #acr("aCMS")
  [@aCMSarch]. 

== Datenextraktionsoptimierung <Optimierungsverfahren>
// Die automatische Datenextraktion aus unstrukturierten Textquellen basierte lange Zeit auf klassischen #acr("NLP")-Verfahren, die mittels regelbasierter und statistischer Ansätze eine strukturierte Datenerfassung ermöglichten
//   #cite(<Sarawagi2008IE>, supplement: "S. 263-264"), 
// heutzutage aber von #acrpl("LLM") in Kriterien wie Genauigkeit und Adaptierbarkeit übertrumpft werden
//   #cite(<Hu2024SwitchLLM>, supplement: "S. 5-8").

Das Ziel der Datenextraktionsoptimierung ist die Verbesserung der Datenextraktionsergebnisse hinsichtlich gesetzter Evaluationsmetriken gegenüber einer Referenzlösung
  #cite(<Sarawagi2008IE>, supplement: "S. 279-281").
In anderen Domänen eingesetzte Verfahren umfassen die Anpassung der #acr("LLM")-Eingabe anhand von Prompt Engineering sowie der Einsatz mehrerer Modelle, welche im Folgenden näher #box([betrachtet werden
  #cite(<Wang2024>, supplement: "S. 5165-5166")
  #cite(<moundas2023prompt>, supplement: "S. 1-2").])

// === Data Preprocessing
// Data Preprocessing umfasst sämtliche Schritte im #acr("NLP"), um unstrukturierte Rohdaten in ein verwertbares Format zu konvertieren
//   #cite(<Kumara2020EmailClassification>, supplement: "S. 338").
// Das Ziel des Preprocessing umfasst die Bereinigung von Inkonsistenzen, Redundanzen und Noise, wodurch die Datenqualität und Leistungsfähigkeit anschließender Extraktions- und Analyseverfahren verbessert wird
//   #cite(<Bala2024DataPreprocessing>, supplement: "S. 1755").
// Dabei beschreibt Noise fehlerhafte, irrelevante oder zufällige Datenanteile, die analytische Auswertungen verfälschen und daher bereinigt werden müssen
//   #cite(<Bala2024DataPreprocessing>, supplement: "S. 1756").

// Um dieses Ziel zu erreichen, existieren diverse Preprocessing-Techniken. Diese müssen je nach Anwendungsfall gewählt werden, um die Effektivität der anschließenden Verarbeitung zu steigern, ohne essenzielle Daten zu eliminieren
//   #cite(<Mbadiwe2024PhishingDetection>, supplement: "S. 46").
// Im Folgenden werden Preprocessing-Techniken genannt, die auf E-Mail Datensätze angepasst sind und sich für eine anschließende Datenextraktion eignen:
//   #cite(<Mbadiwe2024PhishingDetection>, supplement: "S. 47"):

// - *Normalisierung*: Konvertierung von Textabschnitten, um ihre Darstellungsform zu vereinheitlichen. Dazu gehört die Konvertierung von Sonderzeichen oder die Umwandlung in Kleinbuchstaben. #cite(<Kumara2020EmailClassification>, supplement: "S. 339")
// - *Tokenization*: Zerlegung des Textes in einzelne Wörter oder Abschnitte, um weiteres Preprocessing anzuwenden, wie beispielweise zur Ermittlung von Schlüsselworten. #cite(<Kumara2020EmailClassification>, supplement: "S. 339")
// - *Datenbereinigung*: Entfernung von Abschnitten oder Einträgen, die für die anschließende Verarbeitung belanglos sind. Dazu gehören beispielweise leere Einträge oder wiederkehrende Abschnitte wie E-Mail Begrüßungen/Verabschiedungen. #cite(<Kumara2020EmailClassification>, supplement: "S. 338-339")
// #pagebreak()
// #v(-2em)

=== Modellwahl
Die Wahl des #acrpl("LLM") ist maßgeblich für die Qualität der Datenextraktion
  #cite(<Wang2024>, supplement: "S. 5165-5166"). 
#acrpl("LLM") unterscheiden sich in Kriterien wie Parametergröße und Robustheit gegenüber Noise voneinander, wodurch ihre Performance stark an den Anwendungsfall gekoppelt ist
  #cite(<Chang2024SurveyLLMEvaluation>, supplement: "S. 39:6-39:12").
Dabei beschreibt Noise fehlerhafte, irrelevante oder zufällige Datenanteile, die analytische Auswertungen verfälschen und daher bereinigt werden müssen
  #cite(<Bala2024DataPreprocessing>, supplement: "S. 1756").
Anhand diverser Kriterien wird eine Vorentscheidung für einsetzbare #acrpl("LLM") getroffen, die anschließend anhand von Performance-Metriken auf einem Testdatensatz evaluiert werden, um das beste #acr("LLM") für den Anwendungszweck zu ermitteln
  #cite(<Wang2024>, supplement: "S. 5167-5171").
Diese Kriterien umfassen:

- *Modellgröße*: Modelle mit geringem Parameterumfang sind meist schneller und günstiger als große Modelle, wobei große Modelle komplexe Aufgaben ohne Vortraining in diversen Anwendungsbereichen besser #box([absolvieren können #cite(<Kaplan2020ScalingLLM>, supplement: "S. 12-14").])
- *Robustheit*: Robuste Modelle sind in der Datenextraktion performanter bei erhöhter Komplexität der Anfrage, wobei sie meist durch die Anwendung von schlussgefolgertem Denken (Reasoning) #box([ressourcenintensiv arbeiten #cite(<Wei2022PromptEngineering>, supplement: "S. 4-6").])
- *Verfügbarkeit*: Durch externe Faktoren wie Unternehmensrichtlinien, Lizenzen oder zu verwendende Tools (bspw. OpenAIs Structured -Outputs #cite(<OpenAI2025StructuredOutput>)) ist die Wahl des Modells eingeschränkt, wodurch nur eine limitierte Auswahl an Modellen zur Verfügung steht #cite(<xu2023tool>, supplement: "S. 1").

//! Reasoning mal anschauen wie ich das hier erkären kann

Anhand dieser oder weiterer anforderungsspezifischer Kriterien werden Modelle ausgewählt, die sich hinsichtlich der definierten Kriterien zueinander unterscheiden, um den Einfluss jedes Kriteriums auf die Qualität der Modellausgabe zu evaluieren und eine fundierte Modellwahl zu ermöglichten
  #cite(<Wang2024>, supplement: "S. 5167-5171")

// Anknüpfend an die Wahl des #acrpl("LLM") kann dieses anhand von Hyperparameters optimiert werden wie mit der in @llm_grundlagen beschriebenen Temperatur eines Modells
//   #cite(<Du2025temperature>, supplement: "S. 1"). 
// In der Datenextraktion erzielen geringe Temperaturen im Bereich zwischen 0 und 1.25 im Vergleich die höchste Genauigkeit
//   #cite(<Windisch2024TemperatureLLMClinicalTrials>, supplement: "S. 5-17").
// Wie die Wahl des #acrpl("LLM") wird die optimale Modelltemperatur in Form eines Experiments ermittelt

// Zur Ermittlung der optimalen Temperatur kann der #acr("TURN")-Algorithmus angewendet werden. Dieser ermittelt durch $#vars("N")$-fache Abtastung die optimale Temperatur mithilfe des #acr("EntP"), an welchem die logarithmische Entropie einen Wendepunkt besitzt und die optimale Temperatur bestimmt werden kann. Mithilfe des „Best-of-N“-Verfahren, welches $#vars("N")$ verschiedene Ausgaben [$#varf("N")$] mit Evaluationsmetriken bewertet und den besten Evaluationswert zurückgibt, kann die optimale Temperatur bestimmt werden.
//   #cite(<Du2025temperature>, supplement: "S. 1-8")

// === Large Language Model Stacking
// Genereller Prozess mit Pipeline Repitition:
// https://pmc.ncbi.nlm.nih.gov/articles/PMC11572044/pdf/jmdh-17-5163.pdf

// Das Konzept basiert methodisch auf dem Prinzip des Stacking, bei dem Vorhersagen mehrerer Modelle kombiniert und als Eingaben für ein zusätzliches Modell genutzt werden, um eine finale, verbesserte Vorhersage zu erhalten. Dabei werden die einzelnen Modellfehler gezielt korrigiert, indem die systematischen Schwächen der Basis-Modelle durch ein übergeordnetes Modell ausgeglichen werden (Wolpert, 1992, S. 241–242)

// @Hu2024SwitchLLM

#pagebreak()
#v(-2em)

=== Prompt Engineering <PromptEngineering>
Prompt Engineering bezeichnet die gezielte Formulierung von Prompts, um die Qualität von #acr("LLM")-Ausgaben zu steigern 
  #cite(<Sahoo2024PromptEngineering>, supplement: "S. 1").
Dies kann durch die Anwendung von Prompting-Templates und -Techniken umgesetzt werden
  #cite(<Sahoo2024PromptEngineering>, supplement: "S. 2-10"). 
Prompt Engineering zeichnet sich durch seine simplifizierte Umsetzbarkeit und Effektivität bei der Optimierung von #acrpl("PLM")-Outputs aus
  #cite(<Nazi2025PromptEngineering>, supplement: "S. 7-11")
  #cite(<Sahoo2024PromptEngineering>, supplement: "S. 1").

Ein Prompt enthält Textsegmente wie Aufgabenstellungen, Kontext oder Beispiele, die das LLM zur Generierung einer Antwort benötigt
  #cite(<Polat2024PromptEngineering>, supplement: "S. 3-4").
Gute Prompts weisen eine präzise Zieldefinition, eine klare Struktur und kontextbezogene Informationen auf
  #cite(<ye2024promptengineeringpromptengineer>, supplement: "S. 1-2").
Um die Gewichtung dieser durch das Modell zu kontrollieren, kann einem Textsegment eine Rolle zugewiesen werden
  #cite(<OpenAI2025PromptEngineering>).
Hierbei wird zwischen folgenden Rollen unterschieden:

- *System Message*: Spezifiziert die Rahmenbedingungen oder Verhaltensregeln des Modells und wird von Modellen stärker gewichtet als die User Message #cite(<Microsoft2025SystemMessage>).
- *User Message*: Enthält die zu bewältigende Aufgabe #cite(<OpenAI2025PromptEngineering>).

Prompt Engineering nutzt diese Eigenschaften aus, um dem Modell gezielte Vorgaben zu geben, wie eine Aufgabe zu bewältigen ist
  @Microsoft2025PromptEngineering. 
Im Folgenden werden Prompting-Techniken vorgestellt, welche ihn vergleichbaren Anwendungsfällen diverser Domänen zu einer Steigerung der Modellausgabequalität #box([geführt haben
  #cite(<Sahoo2024PromptEngineering>, supplement: "S. 2-9")
  #cite(<brown2020language>, supplement: "S. 20-21"):])

- *Zero-Shot-Prompting*: Das #acr("LLM") erhält ausschließlich eine Aufgabe, ohne die Hinzugabe weiterer Daten #cite(<Sahoo2024PromptEngineering>, supplement: "S. 3"). Dies erlaubt es, #acrpl("LLM") unmittelbar einzusetzen, bedingt jedoch oftmals eine geringere Leistung bei #box([komplexen Fragestellungen #cite(<Nazi2025PromptEngineering>, supplement: "S. 7-11").])

- *One-/Few-Shot-Prompting*: Das #acr("LLM") erhält eine Aufgabe mit Hinzugabe von einem oder mehrerer Beispiele, bestehend aus Aufgabenstellung, Kontext und idealer #acr("LLM")-Ausgabe. One/Few-Shot-Prompting übertrifft die Genauigkeit von Zero-Shot-Prompting in mehreren Bereichen, benötigt aber mehr Eingabetokens sowie vordefinierte Beispiele mit manuell validierten Ergebnissen #cite(<Sahoo2024PromptEngineering>, supplement: "S. 2"). Mit steigender Beispielanzahl wächst die Genauigkeit der Extraktion #cite(<brown2020language>, supplement: "S. 20-21"), wobei der Zuwachs der Genauigkeit ab vier bis acht Beispielen abflacht und nur geringfügig eine Verbesserung erzielt #cite(<min2022rethinking>)

- *#acr("CoT")-Prompting*: #acr("CoT")-Prompting fordert das Modell zur Step-by-Step Lösung der Aufgabe auf. Durch den größeren Kontext liefert #acr("CoT")-Prompting bei komplexen Aufgaben bessere #acr("LLM")-Ausgaben, erfordert aber erhöhten manuellen Prompting-Aufwand durch #box([exakte Kontextbeschreibung #cite(<Polat2024PromptEngineering>, supplement: "S. 7").#cite(<Sahoo2024PromptEngineering>, supplement: "S. 2-7")])

- *Self-consistency-Prompting*: Ähnlich zu #acr("CoT")-Prompting erhält das #acr("LLM") neben der Aufgabe die Aufforderung, eigene Zwischenergebnisse zu produzieren und diese kritisch zu hinterfragen #cite(<Polat2024PromptEngineering>, supplement: "S. 8-9"). Dadurch validiert sich das Modell selbst, wodurch Halluzinationen reduziert  und die Qualität der Modellausgabe gegenüber anderen Prompting-Techniken in #box([Datenextraktionsaufgaben verbessert werden kann #cite(<Wang2023SelfConsistency>, supplement: "S. 5-8").])

// - *#acr("CoVe")-Prompting*: Das Modell durchläuft 4 Schritte:
//   1. Initiale Lösung der Aufgabe durch das Modell 
//   2. Formulierung von Fragen zur Validierung der Ergebnisse 
//   3. Validierung des initialen Ergebnis mittels generierter Fragen
//   4. Ausgabe des überarbeitete Ergebnis 
//   #v(-0.7em)
//   #acr("CoVe") wird eingesetzt, um Halluzinationen von #acrpl("LLM") #cite(<ji2023hallucination>, supplement: "S. 4") zu minimieren. #cite(<Dhuliawala2023CoVe>, supplement: "S. 1-9")

Die praktische Umsetzung von vergangenen Anwendungsfällen zeigt, dass durch die Kombination mehrerer Prompting-Techniken, die Qualität der Modellausgabe erheblich gesteigert werden kann
  #cite(<Sahoo2024PromptEngineering>, supplement: "S. 2")
  #cite(<Polat2024PromptEngineering>, supplement: "S. 14-23").
Ebenso übertreffen #acrpl("LLM") generierte Prompts manuell erstellte Modelleingaben in Leistung, weswegen die in dieser Arbeit eingesetzten Prompts mithilfe von #acr("AI") verbessert werden
  #cite(<Zhou2022AutoPromptEngineering>, supplement: "S. 8-10").
Inwiefern die Datenextraktion mittels Prompt Engineering optimiert werden kann, wird in @Modeling untersucht.

#pagebreak()
#v(-2em)

== Evaluationsmetriken <Evaluationsmetriken>
Um den Erfolg der #acr("LLM")-gestützten Datenextraktion messbar zu machen, werden geeignete Evaluationsmetriken bestimmt. Diese spalten sich auf in Klassifikationsmetriken und Token-Similarity-Metriken.
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 6-7")

Bei der Klassifizierung werden Daten in eine oder mehrere Klassen zugeordnet und anhand einer Referenzklassifizierung evaluiert
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 6").
Hierbei wird zwischen Einfach- und Mehrfach-Klassifizierung unterscheiden. Bei Einfach-Klassifizierung wird einem Datensatz eine Klasse zugeordnet, bei Mehrfach-Klassifizierung können einem Datensatz mehrere Klassen zugeordnet werden.

Token-Similarity Metriken hingegen evaluieren Wortsequenzen. Dafür werden Metriken wie #acrf("ROUGE") eingesetzt, die eine Wortsequenz gegenüber einer Referenzquelle evaluiert und anhand der Überschneidung einen #box([Wert bestimmt
  #cite(<Lin2004>, supplement: "S. 1-2").])

Als Referenzquellen werden Quellen verwendet, zu denen bereits eine ideale Extraktion besteht. Zur Schaffung einer Evaluationsgrundlage werden i.d.R. Daten #box([manuell evaluiert
  #cite(<Li2024>, supplement: "Abs. 1").])

=== Precision, Recall und F1-Score <PrRecF1>
Precision, Recall und F1-Score sind drei weit verbreitete Metriken zur Evaluation von Klassifikationen durch ein Modell gegenüber einer Referenzquelle
  #cite(<Ghamrawi2005CollectiveMLC>, supplement: "S. 5"). 
Sie geben Aufschluss, inwiefern eine Modellklassifikation der #box([Referenzklassifikation entspricht
  #cite(<adamson2023ml_ehr>, supplement: "S. 6")
  #cite(<srivastava2024medpromptextract>, supplement: "S. 7-9")
  #cite(<Hein2025>, supplement: "S. 8").])

Sei $#vars("c")$ eine #varl("c"), $#vars("L")$ die #varl("L") ${#vars("c")_1, #vars("c")_2, ... #vars("c")_#vars("L")}$ inklusive der Null-Klasse $#vars("c")_\u{2205}$ bei fehlender Label-Zuweisung, $abs(#vars("L"))$ die Kardinalität der Menge $#vars("L")$, $#vars("P")\u{2286}#vars("L")$ die #varl("P") und $#vars("H")\u{2286}#vars("L")$ die #varl("H"). Ist $abs(#vars("L"))>1$ und einer Extraktion kann genau eine Klasse zugeordnet werden, so spricht man von einem Multi-Label-Klassifikation mit eindeutiger Label-Zuordnung. Dafür wird der One-vs-All Ansatz
verwendet, bei dem je #varl("c") $#vars("c") \u{2208} #vars("L")$ eine binäre Klassifikation vorgenommen wird, indem alle Exemplare der Klasse $#vars("c")$ als positiv und alle übrigen als negativ betrachtet werden, wodurch das ursprüngliche Mehrklassenproblem auf $abs(#vars("L"))$ unabhängige Binäraufgaben reduziert wird
   #box([#cite(<rifkin2004onevsall>, supplement: "S. 1-2"). ])
Dies wird für $#vars("P")$ und $#vars("H")$ durchgeführt und die Menge der überschneidenden Klassen den in @ConfusionMatrixOneDimensional dargestellten Mengen je Klasse zugewiesen. Wird einem Eintrag sowohl in $#vars("P")$ als auch in $#vars("H")$ der Klasse $#vars("c")_\u{2205}$ zugeordnet, wird dieser Eintrag als korrekt klassifiziert identifiziert und der Menge #box([$#vars("TP")$ zugeordnet.
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 7-9")])

// Precision, Recall und F1-Score basieren auf der Mächigkeit der Mengen #var("TP"), #var("TN"), #var("FP") und #var("FN"), welche die Anzahl der korrekten bzw. inkorrekten Klassen durch ein #box([Klassifikationsmodell widerspiegeln
//   [@ConfusionMatrixOneDimensional]
//   #cite(<Hu2024LLMEvaluation>, supplement: "S. 7-9").])

  #figure(caption: "Confusion Matrix für eindimensionale Klassifizierung je Klasse " + cite(<Lipton2014Thresholding>, supplement: "S. 3"), table(
    columns: (auto, auto, auto),
    inset: 8pt,
    align: horizon,
    table.header(
      [],[*Tatsächlich positiv*], [*Tatsächlich negativ*],
    ),
    [#align(left)[*Als positiv klassifiziert*]],
      [$#varf("TP")$],
      [$#varf("TN")$],
    [#align(left)[*Als negativ klassifiziert*]],
      [$#varf("FP")$],
      [$#varf("FN")$],
    
  ))<ConfusionMatrixOneDimensional>

Precision gibt an, welcher Anteil der als positiv identifizierten Ergebnisse tatsächlich positiv ist. Sie misst die Fähigkeit eines #acrpl("LLM"), negative Instanzen zu filtern. Die Formel der Precision ist im Folgenden dargestellt. Hierbei entspricht $abs("Menge")$ der Kardinalität einer Menge: 
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 8")

#align(center, [
  $ "Precision" 
  = "korrekt als positiv klassifizierte Einträge" / "als positiv klassifizierte Einträge" 
  = abs(#vars("TP")) / (abs(#vars("TP")) + abs(#vars("FP"))) $
])

Recall, auch bekannt als "True Positive Rate" oder "Sensitivity", beschreibt, wie vollständig relevante Ergebnisse erkannt wurden. Sie bestimmt, inwiefern ein Modell positive Ergebnisse identifiziert. Die Formel für Recall lautet:
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 7-8")

#align(center, [
  $ "Recall" 
  = "korrekt als positiv klassifizierte Einträge" / "tatsächlich positive Einträge"
  = abs(#vars("TP")) / (abs(#vars("TP")) + abs(#vars("FN"))) $
])

Der F1-Score bildet das harmonische Mittel zwischen Precision und Recall. Die Formel für den F1-Score lautet:
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 8")

#align(center, [
  $ "F1-Score" 
  = (2dot"Precision"dot"Recall") / ("Precision"+"Recall")
  = (2 dot abs(#vars("TP"))) / (2 dot abs(#vars("TP")) + abs(#vars("FP")) + abs(#vars("FN"))) $
])

// Die dargestellten Formeln beziehen sich auf den mengenbasierten F1-Score. In der Literatur gibt es diverse Abwandlungen, die ihn einsetzbar in binärer Klasisfikation sowie der Evaluation von Texten machen. Eine textbasierte Evaluation anhand des F1-Scores wird in @ROUGE vorgestellt.
//   #cite(<Hu2024LLMEvaluation>, supplement: "S. 7-14")

// === Micro- und Macro F1-Score
// Zur Evaluation mehrerer binärer oder Mehrfach-Klassifikationsaufgaben in $#vars("L")$ Klassen werden der Micro- und Macro-F1-Score verwendet. Der Micro-F1-Score gewichtet häufig vorkommende Klassen stärker, während der Macro-F1-Score alle Klassen gleich gewichtet.
//   #cite(<Ghamrawi2005CollectiveMLC>, supplement: "S. 5")

// Zur Berechnung des Micro-F1-Score werden die Mengen $#vars("TP")$, $#vars("TN")$, $#vars("FP")$ und $#vars("FN")$ über alle Klassen aggregiert und die $"Precision"_"micro"$ und der $"Recall"_"micro"$ berechnet. Aus diesen wird der Micro-F1-Score mit den folgenden Formeln berechnet 
//   #cite(<Hu2024LLMEvaluation>, supplement: "S. 9-11"):

// $ 
//   "Precision"_"micro" 
//   = (sum_(i=1)^abs(#vars("L")) abs(#vars("TP")_i)) / (sum_(i=1)^abs(#vars("L")) abs(#vars("TP")_i) + abs(#vars("FP")_i))
// $

// $ 
//   "Recall"_"micro" 
//   = (sum_(i=1)^abs(#vars("L")) abs(#vars("TP")_i)) / (sum_(i=1)^abs(#vars("L")) abs(#vars("TP")_i) + abs(#vars("FN")_i))
// $

// $ 
//   "Micro-F1-Score" = 2 dot ("Precision"_"micro" dot "Recall"_"micro") / ("Precision"_"micro" + "Recall"_"micro")
// $

// Der Macro-F1-Score berechnet einen F1-Score je Klasse und gibt den Durschnitt dieser zurück
//   #cite(<Ghamrawi2005CollectiveMLC>, supplement: "S. 5"):

// #align(center, [
//   $ "Macro-F1-Score" 
//   = 1 / abs(#vars("L")) sum_(i=1)^abs(#vars("L"))() (2dot#vars("TP")_i) / (2dot#vars("TP")_i + #vars("FN")_i + #vars("FP")_i) $
// ])

// Bei der Evaluation von #acr("LLM")-Outputs werden beide Metriken eingesetzt, da so die Performace für alle Outputs als auch für weniger häufige Klassen gemessen wird.
//   #cite(<Ghamrawi2005CollectiveMLC>, supplement: "S. 5-6")

// === Jaccard Index
// Der Jaccard-Index ist ein statistisches Maß zur Bestimmung der Ähnlichkeit zweier Mengen $A$ und $B$. Er misst den Anteil der Schnittmenge $A \u{2229} B$ zur Vereinigungsmenge $A\u{222A}B$ in einem Wert zwischen 0 und 1.
//   #cite(<Fletcher2018JaccardIndex>, supplement: "S. 4-5")

// #align(center, [
//   $ "Jaccard-Index" = (A \u{2229} B) / (A \u{222A} B) $
// ])

// In der #acr("LLM")-Evaluation wird der Jaccard-Index als Metrik zur Bewertung von Multi-Label Klassifikationsaufgaben eingesetzt, bei denen einem Datenelement mehrere Merkmale zugeordnet werden können
//   #cite(<Nam2014LargeScaleML>, supplement: "S. 9"). 
// Hierbei wird $A$ als die Menge der vom #acr("LLM") bestimmten Labels definiert, während $B$ die Referenzmenge der tatsächlich erwarteten Labels darstellt.
//   #cite(<Patwardhan2025ConsistencyLLMs>, supplement: "S. 2-6")

=== Recall-Oriented Understudy for Gisting Evaluation <ROUGE>
#acr("ROUGE") ist eine Evaluationsmetrik des #acr("NLP"), welche zur Evaluation von generierten Texten gegenüber einer Referenzquelle angewendet wird
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 11-12").
Sie quantifiziert die Ähnlichkeit zweier Texte in einer Metrik und ermöglicht gegenüber Klassifikationsmetriken die Evaluation von Auswirkungen der Modellierung auf Freitexte
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 14").
#acr("ROUGE")-n, eine Umsetzung von #acr("ROUGE"), misst den Überlappungsgrad zwischen einem generierten Text zu einer Referenz mittels N-Grammen, welche Wortfolgen der Länge N repräsentieren
  #cite(<Lin2004>, supplement: "S. 1-2").
Formal entspricht #acr("ROUGE")-n dem in @PrRecF1 definierten F1-Score, wobei anstatt absoluter Zuordnung die Übereinstimmung von N-Grammen als True Positive herangezogen werden #cite(<Hu2024LLMEvaluation>, supplement: "S. 14").
Dadurch lassen sich die Metriken Precision, Recall und F1-Score zur Evaluation, hinweg über verschiedene Arten an #box([Extraktionsfeldern, aggregieren und berechnen #cite(<Lin2004>, supplement: "S. 1-2")])

Sei $#vars("\u{03C9}")$ ein #varl("\u{03C9}"), $#vars("b") = (#vars("\u{03C9}")_1, #vars("\u{03C9}")_2,...,#vars("\u{03C9}")_(#vars("\u{039B}")_#vars("b")))$ ein #varl("b") der Länge $\u{039B}_#vars("b")$ als Wortsequenz von $#vars("\u{03C9}")_1$ bis $#vars("\u{03C9}")_(#vars("\u{039B}")_#vars("b"))$ und $#vars("d") = (#vars("\u{03C9}")_1, #vars("\u{03C9}")_2,...,#vars("\u{03C9}")_(#vars("\u{039B}")_#vars("d")))$ ein #varl("d") der Länge $\u{039B}_#vars("d")$ als Wortsequenz von $#vars("\u{03C9}")_1$ bis $#vars("\u{03C9}")_(#vars("\u{039B}")_#vars("d"))$. Damit ist $#vars("B")$ die #varl("B"), $#vars("D")$ die #varl("D") und $#vars("D") \u{2229} #vars("B")$ die Menge an überschneidenden n-Grammen, welche der Menge $#vars("TP")$ auf Basis von N-Grammen entsprechen. Die im generierten Text vorkommenden, aber nicht in der Referenz enthaltenen N-Gramme $#vars("B")\u{2216}#vars("D")$ entsprechen der Menge $#vars("FP")$, in der Referenz, aber nicht im generierten Text enthaltene N-Gramme $#vars("D")\u{2216}#vars("B")$ der Menge $#vars("FN")$ und weder in $#vars("B")$ noch in $#vars("D")$ vorkommende N-Gramme der Menge $#vars("TN")$. Auf Basis dieser N-Gramm basierten Mengen lassen sich $"Precision"_n$, $"Recall"_n$ sowie $#acrs("ROUGE")_n$ als N-Gramm basierter F1-Score mit den #box([folgenden Formeln berechnen:
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 14"):])

$
  "Precision"_n = abs(#vars("D")\u{2229}#vars("B")) / abs(#vars("B"))
$

$
  "Recall"_n = abs(#vars("D")\u{2229}#vars("B")) / abs(#vars("D"))
$

$ 
  "ROUGE-n" = 2 dot ("Precision"_"n" dot "Recall"_"n") / ("Precision"_"n" + "Recall"_"n")
$

=== Accuracy
Accuracy, oft übersetzt als Genauigkeit,  ist ein Maß zur Bewertung von Klassifikationsaufgaben. Sie misst den Anteil der korrekt klassifizierten Instanzen von allen Instanzen eines Datensatzes. Gegenüber F1 erweitert Accuracy die betrachteten Mengen um #box([die Menge $#vars("TN")$
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 7")])

#align(center, [
  $ 
    "Accuracy" 
    = (abs(#vars("TP")) + abs(#vars("TN"))) / (abs(#vars("TP")) + abs(#vars("TN")) + abs(#vars("FP")) + abs(#vars("FN")))
    = (abs(#vars("TP")) + abs(#vars("TN"))) / abs(#vars("L"))
  $
])

Accuracy kann, analog zu @PrRecF1, sowohl als Exact-Match berechnet werden, wobei nur vollständig identische Vorhersagen als korrekt identifiziert klassifiziert werden, als auch n-gramm-basiert, wie in @ROUGE, bei welcher jedes N-Gramm als Klassifikationseinheit betrachtet wird
  #cite(<Hu2024LLMEvaluation>, supplement: "S. 12-14"). 
Die zugehörigen Formeln ergeben sich aus den in den genannten Kapiteln dargestellten $#vars("TP")$-, $#vars("TN")$-, $#vars("FP")$- und $#vars("FN")$-Definitionen.

// === Large Language Model as a Judge
// #acr("LLM") as a Judge bezeichnet einen Evaluationsansatz, bei dem #acrpl("LLM") zur Bewertung von Ergebnissen anderer Modelle eingesetzt werden
//   #cite(<Li2024LLMJudge>, supplement: "S. 1-2"). 
// Das Konzept basiert auf "Stacking"
//   #cite(<wolpert1992stacked>, supplement: "S. 6-15"),
// bei dem mehrere Modelle squentiell hintereinander geschaltet werden und sich gegenseitig bewerten und vervollständigen
//   #cite(<Özbligin2025Stacking>, supplement: "S. 6"). 
// #acr("LLM")-as-a-Judge nutzt diesen Ansatz, indem ein #acr("LLM") nach der Produktion eines #acr("LLM")-Outputs eingesetzt wird, um anhand definierter Kriterien diesen zu bewerten und quantitative Metriken zuzuweisen 
//   #cite(<Li2024LLMJudge>, supplement: "S. 2-3").

// #acr("LLM")-as-a-Judge weist Vorteile im Gegensatz zu traditionellen regelbasierten Bewertungsmethoden wie BLEU oder ROUGE auf, da #acrpl("LLM") deutlich besser in der Lage sind, angepasst an dynamischen Umständen und unstrukturierten Texten, diesen zu evaluieren
//   #cite(<Liu2016HowNotToEvaluate>, supplement: "S. 2123-2126").
// Darüber hinaus weisen durch #acr("LLM")-as-a-Judge getroffene Evaluationen hohe Korrelationen mit menschlicher Bewertung auf, wodurch hohe Kosten einer manuellen Evaluation in Teilen eingespart werden können
//   #cite(<Krumdick2025NoFreeLabels>, supplement: "S. 1").
// Mittels #acr("AI") Agenten zeigt der Einsatz von #acr("LLM")-as-a-Judge bereits verbesserte Genauigkeit und bietet eine weitere Möglichkeit der Prozessautomatisierung
//   #cite(<Li2024MATEval>, supplement: "S. 8-11").
//   #cite(<Liu2016HowNotToEvaluate>, supplement: "S. 1-2")

// Jedoch ist der Einsatz von #acr("LLM")-as-a-Judge mit Herausforderungen verbunden. Durch den Einsatz von #acrpl("LLM") zur Evaluation treten die in @LLMRisiken genannten Herausforderungen wie Halluzination auf
//   #cite(<Li2024LLMJudge>, supplement: "S. 4-5"). 
// Darüber hinaus variiert die Bewertung von #acr("LLM")-as-a-Judge-Modellen bei wiederholter Evaluation 
//   #cite(<schroer2021systematic>, supplement: "S. 2"). 
// Hinzu kommt, dass die Qualität der Bewertung stark von der Fähigkeit des #acrpl("LLM") abhängt, die bewerteten Aufgaben selbst zu lösen, wodurch die Wahl des #acr("LLM")-as-a-Judge-Modells stark abhängig von der zu bewertenden Aufgabe gewählt werden muss 
//   #cite(<Krumdick2025NoFreeLabels>, supplement: "S. 1-3"). 

// Für eine praktische und zuverlässige Anwendung von LLM-as-a-Judge ist es daher unabdingbar, eine Validierung mit von Menschen annotierten Referenzdaten durchzuführen, um ein geeignetes #acr("LLM") zu wählen und systematische Fehlerquellen der Evaluation zu reduzieren 
//   #cite(<Krumdick2025NoFreeLabels>, supplement: "S. 1-3").

= Praxis <Praxis>
Im Folgenden wird die praktische Umsetzung der Optimierung von strukturierter Datenextraktion beschrieben. Dabei werden die im @CrispDmPhasen dargestellten Phasen von #acr("CRISP-DM") nacheinander durchlaufen.

== Business Understanding <BusinessUnderstanding>
#acr("AI") und ihre Aktivierung bei Kunden ist eines der Hauptziele der SAP SE für das Jahr 2025
  #cite(<SAP2025AIThemes>).
Um diesen Fortschritt messbar zu machen, nutzt der Vorstand Reportingdaten aus der #acr("RIG"). Diese werden aus den Opportunities des #acr("MXP")-Tools extrahiert und enthalten Erfolgs-/Misserfolgsdaten je Kunde/Produkt. Dafür ist es notwendig, dass die E-Mails der #acr("RIG")-Inbox bearbeitet und die Daten je Opportunity von der #acr("RIG") gepflegt werden.

Mit der Erstellung einer Opportunity bei Kaufinteresse eines Kunden wird diese mit Daten aus darauffolgenden Kundeninteraktionen mittels #acr("aCMS") der #acr("MXP") von Team zu Team ergänzt
  #cite(<mxp2025documentation>, supplement: "Abs. Content Management"). 
Der Status Quo ist, dass diese Daten manuell über eine Experience der #acr("RIG")-#acr("MXP") je Opportunity eingepflegt werden
  #cite(<mxp2025documentation>, supplement: "Abs. Model Content").
Diese Arbeit wird durch das Backoffice-Subteam der #acr("RIG") durchgeführt, deren Aufgabe es ist, anhand von Daten aus der #acr("RIG")-E-Mail-Inbox Reportingdaten in die zugehörige Opportunity auf der #acr("MXP") einzupflegen und Kundenmailkampagnen an ausstehende Opportunities zu senden. Der Vorstand nutzt die aggregierten Daten aller Opportunities der Periode, um fundierte Entscheidungen hinsichtlich der SAP #acr("AI")-Strategie zu fällen
  #cite(<mxptool>).

Die #acr("RIG")-E-Mail-Inbox ist die zentrale Anlaufstelle für die Kontaktaufnahme mit der #acr("RIG"). Neben internen Fragen zu Business #acr("AI") nutzt das SAP Kundenteam die Inbox zur Koordinierung der #acr("AI")-Aktivierung bei Kunden. Sobald eine E-Mail in der #acr("RIG")-Inbox ankommt, ist das Ziel des Backoffice-Teams, die zugehörige Opportunity auf der #acr("MXP") zu ermitteln. Um diese eindeutig zu identifizieren, wird eine Kombination aus den drei folgenden #acrpl("ID") benötigt @mxptool:

- *#acrs("CRM")-Account-#acr("ID")*: Die #acr("ID") eines Kunden bzw. #acr("CRM")-Accounts im internen SAP System.
- *Opportunity-#acr("ID")*: Die #acr("ID"), welche eine Verkaufsmöglichkeit von Produkten gegenüber einem Kunden im #acr("CRM") abbildet.
- *Material-#acr("ID")*: Die im System hinterlegte Produktnummer des gekauften SAP Produktes. Sie bildet den #acr("CRM") seitigen Vertragsbestandteil ab, weswegen mehrere Material-#acrpl("ID") für ein Produkt existieren.

Sind diese Daten in der E-Mail nicht gesetzt, wird versucht, über einen Sekundärschlüssel den zugehörigen #acr("MXP")-Eintrag zu identifizieren. Zu diesen #box([Feldern gehören:])

- *Kundenname*: Der Name des vom #acr("AE") betreuten Kunden.
- *Produktname*: Der Name des verkauften Produktes. 

Im Falle einer erfolgreichen Identifikation der Opportunity pflegt das Backoffice-Team folgende Daten ein:

- *Status*: Der aktuelle Status der Aktivierung. Dieser kann einen der in #cite(<RIG2025processes>, form: "prose", supplement: "S. 9-14") definierten Status annehmen.
- *Analysis*: Eine kurze Zusammenfassung der Arbeit der #acr("RIG") mit Zeitstempel.
- *#acr("RIG")-Kontakt*: Der Ansprechpartner für den #acr("AE") aus der #acr("RIG"). Dieser wird anhand der Interaktionshäufigkeit mit dem #acr("AE") zugeordnet.
- *On-Hold-Date*: Das Datum, bis zu welchem eine Aktivierung beim Kunden temporär ausgesetzt ist. Wird gesetzt, wenn der Status auf 'On Hold' #box([gesetzt wird.])

Das Hauptproblem des Backoffice-Teams ist eine Zuordnung der E-Mail zum zugehörigen #acr("MXP")-Eintrag, da diese sowohl Duplikate als auch fehlende Einträge aufweisen. Anhand der in einer E-Mail ersichtlichen Daten ist oft eine eindeutige Identifikation der zugehörigen #acr("MXP")-Opportunity nicht oder nur unter erhöhtem manuellen Suchaufwand möglich. Darüber hinaus muss die gesamte E-Mail mitsamt Verlauf gelesen werden, um die Felder auf der #acr("MXP") zu setzen. Dieser Prozess wird für jede E-Mail der #acr("RIG")-Inbox wiederholt und kostet das Backoffice-Team viel Zeit.

Das Ziel dieser Arbeit ist es, das Setzen von Reportingdaten in Teilen zu automatisieren und damit die #acr("RIG") hinsichtlich der Bearbeitung der Inbox zu entlasten. Dafür soll ein #acrf("PoC") entwickelt werden, welcher E-Mails verarbeiten und an die zugehörige #acr("MXP")-Opportunity reporten kann. Notwendig dafür ist die Extraktion von Reporting- und Zuordnungsdaten in einer ausreichend hohen Qualität, dass eine Identifikation des zugehörigen #acr("MXP")-Eintrags möglich ist. Dabei beschränkt sich der #acr("PoC") auf die Identifikation eindeutiger Opportunities, welche keine Dopplungen auf der #acr("MXP") aufweisen und somit eindeutig #box([identifizierbar sind.])

Zur Produktivnahme innerhalb der #acr("AI") #acr("RIG") hat diese in ihren Jahreszielen 2025 konkrete #acr("KPI") definiert, welche eine #acr("AI")-gestützte Version erfüllen muss, um implementiert zu werden
  #cite(<RIG2025processes>, supplement: "S. 13"). 
Diese umfassen eine Extraktionsgenauigkeit über alle Felder von mindestens 70% sowie eine Identifikationsratenabweichung zur manuellen Zuordnung von maximal 10%. Darüber hinaus darf die falsch-positiv Rate an identifizierten #acr("MXP")-Opportunities nicht 5% übersteigen, da das Setzen falscher #acr("MXP")-Daten den Beratungsprozess der #acr("RIG") direkt beeinflusst und langfristig der Kundenbindung schaden kann.

Um dieses Ziel zu erreichen, werden im Rahmen eines Experiments die in @Optimierungsverfahren definierten Ansätze der Extraktionsverbesserung angewendet und mittels der in @Evaluationsmetriken beschriebenen Metriken evaluiert. In dieser Arbeit wird keine formale Optimierung durchgeführt, sondern eine explorative Untersuchung zur Steigerung der Extraktionsergebnisqualität aufgrund zu geringer Datengrundlage
  #cite(<Kohavi1995>, supplement: "S. 1138-1139")
  #cite(<Figueroa2012>, supplement: "S. 6-9").
Diese bietet eine Grundlage für weitere empirische Forschung sowie Optimierungsverfahren.

Auf Basis von Literatur zu Datenextraktionsoptimierung diverser Domänen wurden folgende Hypothesen definiert, welche im Rahmen des Experiments auf die Domäne der E-Mail-Kommunikation validiert werden sollen. Die entsprechende Literatur ist jeder Hypothese angehängt:

// durchgeführt, welches die Datenextraktionsrate und -qualität mittels der Optimierungsverfahren aus @Optimierungsverfahren verbessern soll. Folgende Hypothesen werden an das #box([Experiment gestellt:])

- *Hypothese 1*: Der Einsatz von One-Shot-Prompting verbessert die Datenextraktionsgenauigkeit gegenüber Zero-Shot-Prompting #cite(<min2022rethinking>).
- *Hypothese 2*: Few-Shot-Prompting führt zu höherer Datenextraktionsgenauigkeit gegenüber Zero- und One-Shot-Prompting #cite(<brown2020language>, supplement: "S. 20-21").
- *Hypothese 3*: Die Anwendung #acrl("CoT")-Prompting extrahiert qualitativ bessere Daten als ein Basisprompt #cite(<Polat2024PromptEngineering>, supplement: "S. 7").
- *Hypothese 4*: Self-consistency-Prompting extrahiert Daten mit einer höheren Datenextraktionsgenauigkeit als ein Basisprompt #cite(<Wang2023SelfConsistency>, supplement: "S. 5-8").
- *Hypothese 5*: Reasoning-Modelle wie OpenAIs "o1" und "o3-mini" weisen höhere Extraktionsgenauigkeit und geringere Halluzinationen auf gegenüber Non-Reasoning Modellen #cite(<Wei2022PromptEngineering>, supplement: "S. 4-6").
- *Hypothese 6*: Modelle mit großem Parameterumfang weisen bessere Datenextraktionsergebnisse als kleine Modelle auf #cite(<Kaplan2020ScalingLLM>, supplement: "S. 12-14").

Bei der Evaluation des #acrpl("PoC") werden die in @Evaluationsmetriken vorgestellten Metriken Precision, Recall, F1-Score, und Accuracy verwendet, welche auf Basis einer Referenzlösung gebildet werden. Das Extraktionsfeld "Analysis" wird im Gegensatz zu den anderen Extraktionsfeldern mithilfe von #acr("ROUGE")-n sowie einer N-Gramm basierten Accuracy evaluiert, da es sich hierbei um ein Freitextfeld handelt, welches im Gegensatz zu den anderen Feldern nicht exakt der Referenzlösung entsprechen muss.

// Zur Optimierung des Modells sowie zur Validierung des Experiments wird ein reduzierter Datensatz genutzt, um Durchlaufzeiten zu minimieren.

// #pagebreak()
// #v(-2em)
== Data Understanding <DataUnderstanding>
Zur Entwicklung des #acrpl("PoC") wird ein Auszug von zufällig gewählten E-Mails verwendet, welche mittels der Microsoft Graph#acr("API") aus der Outlook-Inbox der #acr("RIG") extrahiert wurden. Die Microsoft Graph#acr("API") ist eine von Microsoft zur Verfügung gestellte Schnittstelle zu einem E-Mail-Postfach, welches die Abfrage von E-Mail-Attributen wie Betreff, Inhalt oder Absender ermöglicht
  #cite(<Microsoft2025GraphAPI>).
Im Folgenden werden die Daten auf ihre Konsistenz und Relevanz für die Datenextraktion geprüft.

#figure(caption: "Attribute und Häufigkeit der Daten. Eigene Darstellung.", image("pictures/DU_Fields_CSV.png", width: 100%))<CSVFieldsFilled>

Der Datensatz wird durch die #acr("RIG") zur Verfügung gestellt und enthält 3641 E-Mails abgeschlossener Kundenaktivierungen aus dem 4. Quartal des Jahres 2024. Eine E-Mail wird mithilfe der in @CSVFieldsFilled festgelegten Attribute dargestellt. Weitere Attribute der Microsoft Graph#acr("API") werden aufgrund von fehlender Relevanz für den Anwendungsfall nicht in Betracht gezogen. Jede E-Mail bildet einen E-Mail-Verlauf ab, bestehend aus der zuletzt gesendeten E-Mail des Verlaufs sowie angehängter vorheriger E-Mails, getrennt durch Metadaten. Hinsichtlich einer Ermittlung des Status #box([und Analyse. ])
// Durchschnittlich beträgt die Länge eines E-Mail-Verlaufs 3,48 E-Mails, wobei die längsten Verläufe im Datensatz 38 E-Mails beinhalten [@DUSubemails].

// #figure(caption: "Attribute und Häufigkeit der Daten. Eigene Darstellung.", image("pictures/DU_Distribution_subemail.png", width: 100%))<DUSubemails>

Die Antworten des Kundenteams der SAP auf die Mailkampagnen der #acr("RIG") sind wie aus @DUCustomerCount ersichtlich meist kundenspezifisch, wobei in einigen E-Mails mehrere Kunden je E-Mail angesprochen werden. Um eine korrekte Identifikation der Opportunity zu garantieren, müssen diese in der weiteren Datenextraktion als alleinstehende mögliche Opportunities behandelt werden.

#figure(caption: "Anzahl der Kunden je E-Mail. Eigene Darstellung.", image("pictures/DU_customers_per_mail.png", width: 100%))<DUCustomerCount>

Anteilig sind in der #acr("RIG")-Inbox 19,5% der E-Mails von der #acr("RIG") gesendet bzw. angrenzenden Abteilungen und 1,56% von "Others" [@DUCountSenderGroups]. Unter "Others" fallen E-Mails von Kontakten, welche keine Relevanz für das Reporting der #acr("RIG") haben, beispielsweise automatisch generierte Antworten von "Microsoft Outlook". Somit sind 78,94% der gesendeten Daten von "Non-#acr("RIG")" Absendern.

#figure(caption: "Anzahl an E-Mails je Sendergruppe. Eigene Darstellung.", image("pictures/DU_Count_Groups.png", width: 100%))<DUCountSenderGroups>

Für die Identifikation der Opportunity sind die Felder 'Subject', 'Body' sowie 'From: (Name)' notwendig, da diese die gesuchten Daten aus @BusinessUnderstanding enthalten:

- *Subject*: Der Betreff einer E-Mail. In den Mailkampagnen der #acr("RIG") werden die #acrpl("AE") aufgefordert, den Kundennamen sowie den Produktnamen in den Betreff der E-Mail zu schreiben, wobei dies in der Realität nur bedingt umgesetzt wird und diese Daten oft in 'Body' zu finden sind [@DUTop4Extr].
- *Body*: Der Inhalt eines E-Mail-Verlaufs, bestehend aus dem Inhalt der zuletzt versendeten E-Mail sowie E-Mail-Inhalte der vorherigen Konversation, i.d.R. abgetrennt durch "From: ... To: ... CC: ...". Er enthält Informationen zu #acr("CRM")-Account-#acr("ID"), Opportunity-#acr("ID"), Status, Analyse und On-Hold-Datum.
- *From: (Name)*: Den Sender einer E-Mail im Format "Nachname, Vorname". Er gibt Aufschluss, inwiefern die E-Mail relevant für weitere Datenverarbeitung ist.

#figure(caption: "Analyse des E-Mail-Betreffs. Eigene Darstellung.", image("pictures/DU_matching_top4.png", width: 100%))<DUTop4Extr>

Zur Analyse der Datenqualität wurde eine erste #acr("LLM")-gestützte Datenextraktion durchgeführt, bei der OpenAIs GPT-4o Modell mittels eines Zero-Shot-Basisprompts zur Extraktion relevanter Informationen aufgefordert wurde. Diese Konfigurationen wurden aufgrund von guten Erfahrungen der #acr("RIG") in anderen internen Prozessen gewählt und die Ergebnisse können als Vergleichswert zur Steigerung der Extraktionsqualität verwendet werden
  #cite(<RIG2025processes>, supplement: "S. 16"). 
Die extrahierten Daten wurden anschließend als Parameter in einen #acr("API")-GET-Request eingebunden und falls dieser genau einen Eintrag zuordnen kann, wird dieser gespeichert.

Es konnten darunter 4398 mögliche Opportunities identifiziert werden. In diesen sind nur in 15,32% die Opportunity-#acr("ID") und in 5,22% die #acr("CRM")-Account-#acr("ID") enthalten, während Daten wie der Kunden- (96,18%) und Produktname (85,92%) in einer hohen Konzentration identifiziert werden können. Diese Daten werden an die #acr("MXP") gesendet und können bei 295 Opportunities (6,71%) den zugehörigen Eintrag identifizieren. 

#figure(caption: "Ergebnisse einer initialen Extraktion. Eigene Darstellung.", image("pictures/DU_Extr_Fields.png", width: 100%))<DUExtrResult>

// Zur Hochrechnung von halluzinierten Opportunities wird der extrahierten Kundennamen gegenüber dem #acr("MXP")-Kundennamen verglichen. Wie in @DPFalsePositive dargestellt stimmt die Benennung der Kunden zwischen E-Mail und #acr("MXP") nicht exakt überein obwohl die zugehörige Opportunity korrekt identifiziert wurde, da oft Anteile des Kundennamen (bspw. die Rechtsform) ausgelassen werden. Durch die Evaluation anhand von #acr("ROUGE")-n und einer Klassifikationsgrenze ab 0.4 für #acr("ROUGE")-1 und ab 0.3 für #acr("ROUGE")-2 kann eine abweichende Opportunity der Menge $#vars("FP")$ zugeordnet werden und eine übereinstimmende Opportunity, trotz Abweichung, der Menge $#var("TP")$. Eine erste Analyse weist darauf hin, dass 

// #figure(caption: "Attribute und Häufigkeit der Daten. Eigene Darstellung.", image("pictures/DP_False_Positives_Extr.png", width: 100%))<DPFalsePositive>

Die Ergebnisse aus @DUExtrResult sollen durch die in @Optimierungsverfahren vorgestellten Ansätze der Steigerung der Datenqualität hinsichtlich Genauigkeit und #acr("MXP")-Identifikationsrate verbessert werden. Auf Basis dieser Erkenntnisse wird im Folgenden ein Datensatz erstellt, welcher zur Modellierung und Evaluierung des Experiments geeignet sind.

#pagebreak()
#v(-2em)
== Data Preparation <DataPrep>
Nach der Analyse der Daten werden die E-Mails des Datensatzes nach ihrer Relevanz für die Datenextraktion klassifiziert. Ausgehend von @DataUnderstanding muss eine E-Mail zur Identifikation der Opportunity im #acr("MXP") folgende #box([Merkmale aufweisen:])

- *Betreff und Inhalt*: Eine E-Mail muss die Attribute 'Subject' und 'Body' aufweisen, damit ein #acr("LLM") notwendige Attribute auslesen kann.
- *Non-#acr("RIG")*: Viele der E-Mails aus dem Datensatz kommen aus der #acr("RIG") selbst. Diese haben aus Geschäftsperspektive keine Relevanz, da diese keine zu extrahierenden Daten enthalten.
- *Datenqualität*: Nach erfolgreicher Extraktion der Daten muss der Produkt- und Kundennamen für eine erfolgreiche Identifikation des Eintrags auf der #acr("MXP") gesetzt sein. 

#figure(caption: "Anteil relevanter Daten. Eigene Darstellung.", image("pictures/DP_relevant_data.png", width: 100%))<DPRelevantData>

Von allen 3641 E-Mails des Datensatzes sind 2845 E-Mails relevant für weitere Datenextraktion, da diese Werte in den Attributen 'Subject' und 'Body' als auch von nicht von der #acr("RIG") oder 'Others' versendet wurden [@DPRelevantData].  Die verbleibenden 796 E-Mails werden aus dem Datensatz entfernt.

Zur Optimierung der Datenextraktion hinsichtlich der Opportunity-Zuordnung werden die in @BusinessUnderstanding definierten Hypothesen auf einem reduzierten Validierungsdatensatz durchgeführt, um Zeit und Kosten zur Modellierung und manueller Erstellung einer Referenzquelle (Labeling) zu schonen. Dieser trennt sich in das Segment "Train", welches zur Angabe von Beispielen an das #acr("LLM") dient, "Dev", welches einen Datensatz zur Validierung der Konfigurationsergebnisse beschreibt, und "Test", auf welchem die Ergebnisse auf dem Validierungsdatensatz hinsichtlich Plausibilität evaluiert werden
  #cite(<Kohavi1995>, supplement: "S. 1138-1139").
Zu jedem der Datensätze wird ein manuell durch den Verfasser extrahierter #box([Referenzdatensatz erstellt.])

Da zur Extraktion #acrpl("PLM") eingesetzt werden, welche in ähnlichen Domänen ohne Vortraining der Modelle hohe Extraktionsergebnisse aufweisen, umfasst der Trainingsdatensatz 5 E-Mails, welche bei One- und Few-Shot-Prompts dem Prompt angehängt werden
  #cite(<Wang2024>, supplement: "S. 5167-5171"). 
Die Anzahl wurde auf Basis von Literatur zur Beispielanzahl von Few-Shot-Prompting gewählt, da diese ab einer Anzahl von 5 Beispielen keine signifikante Steigerung der Ausgabequalität mit zunehmender Beispielanzahl in anderen Domänen nachweisen konnten
  #cite(<brown2020language>, supplement: "S. 20").
Diese wurden zufällig aus dem Datensatz entnommen und werden als Beispiele für One- und #box([Few-Shot-Prompting eingesetzt.])

#set par(leading: 1em)
#figure(caption: "Übersicht des Validierungsdatensatzes auf Basis von " + ref(<DUExtrResult>), table(
    columns: (auto, auto, auto, 9em),
    inset: 8pt,
    align: horizon,
    table.header(
      [*Datenqualität*],[*Anzahl*], [*Anteil mit extr. Entry-#acr("ID")*],[*Fehlende Attr.*],
    ),
    [Hoch],
      [14],
      [10/14 = 71,43%],
      [-],
    [Mittel],
      [23],
      [6/23 = 26,09%],
      [Opportunity-#acr("ID")],
    [Mittel],
      [30],
      [19/30 = 63,33%],
      [Customer-#acr("ID")],
    [Niedrig],
      [33],
      [0/33 = 0%],
      [Customer-#acr("ID"), Opportunity-#acr("ID")],
    
  ))<ReducedDatasetSplit>
#set par(leading: 1.5em)

Der Validierungsdatensatz umfasst 100 E-Mails unterschiedlicher Datenqualität, die in den in @ReducedDatasetSplit dargestellten Teilmengen enthalten sind. Die ausgewählte Anzahl an E-Mails erlaubt die Überrepräsentation seltener Klassen bei weniger zeitintensiver Modellausführung und Datensatzlabeling, da derselbe Datensatz für jede Modell- und Promptkonfiguration durchlaufen werden muss. Hinzu kann durch die kontrollierte Variaton an Datenqualität Overfitting, eine zu starke Anpassung des Modells auf den Trainingsdatensatz, reduziert werden
  #cite(<salman2019overfittingmechanismavoidancedeep>, supplement: "S. 1-2").
Die Datenqualität wurde anhand von @DUExtrResult zugeordnet und alle Daten liegen in einer tabellarischen Form mit den Attributen 'Subject', 'Body' sowie einer zugewiesenen E-Mail-#acr("ID") vor. 

Der Testdatensatz, bestehend aus 20 E-Mails mit zufälliger Datenqualität, wird verwendet, um die Ergebnisse des Validierungsdatensatzes an einem dem Modell unbekannten Datensatz zu überprüfen. Die zufällige Verteilung der Datenqualität ermöglicht eine realitätsnahe Validierung hinsichtlich auftretender Overfitting-Effekte, während die geringe Größe des Datensatzes ein kostengünstiges manuelles Labeling der Daten erlaubt
  #cite(<huang2024datacollectionlabelingtechniques>, supplement: "S. 1").

  #figure(caption: "Anteil identifizierten Opportunities je Qualität. Eigene Darstellung.", image("pictures/DP_groups_extracted_entry_id.png", width: 100%))<DPgroups_entry_id>

Wie aus @DPgroups_entry_id ersichtlich ist eine korrekte Extraktion mit bisherigem Ansatz bei 35% der E-Mails des Validierungsdatensatzes möglich. Dennoch wurde bei 10% der E-Mails eine falsche #acr("MXP")-Opportunity zugewiesen, womit der Anteil der falsch positiv identifizierten #acr("MXP")-Einträge bei 22,22% der Opportunities liegt. Dieser Wert ist nach den von der #acr("RIG") definierten Zielen aus @BusinessUnderstanding zu hoch für eine Produktivnahme.

Dieser Anteil soll durch @Modeling verringert und der Anteil der korrekt identifizieren Einträge erhöht werden, indem Daten korrekt identifiziert werden. Im Folgenden wird das Vorgehensmodell beschrieben, dieses Ziel #box([zu erreichen.])

// #pagebreak()
// #v(-2em)
== Modelling <Modeling>
Zur Optimierung der Extraktion strukturierter Daten werden, wie in @LLMDataExtr erläutert, #acrfpl("LLM"), aufgrund ihrer hohen Performance gegenüber alternativen Verfahren, eingesetzt
  #cite(<Hu2024SwitchLLM>, supplement: "S. 5-8")
  #cite(<Aguda2024FinancialAnnotators>, supplement: "S. 4-5"). 
Vom Training eines eigenen Modells wird aufgrund von geringer Datengrundlage sowie Kosten- und Rechenleistung abgesehen und verschiedene #box([#acrpl("PLM") eingesetzt
  #cite(<Wang2024ResponsibleLLM>, supplement: "S. 1:13").])

Da es sich bei der Verarbeitung der Daten, um sensitive Geschäftsdaten der SAP SE handelt, wird zur Verwaltung von Modellanfragen der Orchestration Service des SAP #acr("GenAI") Hub verwendet, welcher eine Anonymisierung von Kunden- und Mitarbeiterdaten vor Modelleingabe mittels "Data Masking" sowie intern eine kostengünstige Verarbeitung erlaubt
  #cite(<SAP_Learning2025>).
Darüber hinaus werden die Funktionen "Prompt Templating" zur dynamischen Generierung von #acr("LLM")-Prompts sowie "Structured Outputs" verwendet
  #cite(<Li2024LLMSAP>).
Neben der Verwendung von "Structured Outputs" existiert über den SAP #acr("GenAI") Hub keine Möglichkeit, ein Modell zu einem einheitlich strukturierten Ausgabeformat zu zwingen, weswegen die Modellwahl dahingehend angepasst wird.
Ein einheitliches Format der #acr("LLM")-Ausgabe ist notwendig, um eine automatisierte Weiterverarbeitung der Daten zu ermöglichen.
Hinsichtlich der Unterstützung von "Structured Outputs" stehen bislang nur die Modelle von OpenAI mit einer einheitlichen Schnittstelle über den Orchestration Service zur Verfügung 
  #cite(<Li2024LLMSAP>),
weswegen in der Modellierung nur diese betrachtet werden. Die dadurch aufkommenden Limitationen werden in @limitations gewürdigt. 

Zur Validierung der Hypothesen aus @BusinessUnderstanding werden zur Extraktion von E-Mail Daten Modelle verwendet, welche sich hinsichtlich Parameterumfang und Robustheit zueinander unterscheiden und eine Verwendung von "Structured Outputs" ermöglichen 
  #cite(<Li2024LLMSAP>)
  #cite(<Kirkovska2024OpenAI>)
  #cite(<openai2024openaio1card>):

- *OpenAI GPT-4o*: GPT-4o, veröffentlicht am 13. Mai 2024 #cite(<OpenAI2025GPT4o>), ist im Vergleich zu den anderen Modellen das älteste Modell, erreicht dennoch hohe Genauigkeit bei Datenextraktionsaufgaben #cite(<balasubramanian2025leveraginglargelanguagemodels>, supplement: "S. 3"). Im Vergleich zu o1 und o3-mini zeichnet sich GPT-4o durch seine geringe #acr("TTFT") von 0,421 Sekunden sowie hohe Parametergröße aus #cite(<Kirkovska2024OpenAI>)#cite(<OpenAI2025GPT4o>).
- *OpenAI o1*: Das Modell o1, eingeführt am 5. Dezember 2024, ist ein Modell, welches Reasoning durch internes #acrl("CoT") umsetzt und somit Extraktionsergebnisse von GPT-4o übertrifft #cite(<brokman2025benchmarkendtoendzeroshotbiomedical>, supplement: "S. 9-12"). Gegenüber GPT-4o und o3-mini basiert o1 auf einem größeren Datensatz, ist mit einer #acr("TTFT") von 12,763 Sekunden im Vergleich das langsamste Modell #cite(<Kirkovska2024OpenAI>). #cite(<openai2024openaio1card>, supplement: "S. 2-6")
- *OpenAI o3-mini*: o3-mini, veröffentlicht am 31. Januar 2025, ist das neueste und kompakteste Reasoning-Modell des SAP #acr("GenAI") Hub. Es zeichnet sich besonders durch sein schnelles und kostengünstiges Reasoning aus, welches in logikbasierten Aufgaben jenes von o1 übertrifft. #cite(<OpenAI2025o3mini>)

Zur Durchführung der Modellierung wird ein Python-Skript verwendet. Python ist eine im Bereich Data Science weit verbreitete Programmiersprache, die, im Gegensatz zu anderen Sprachen, diverse Methoden zur Datenanalyse, -manipulation und -visualisierung als frei-verfügbaren Codepakete (Libraries) bereitstellt
  #cite(<ranjan2023python>, supplement: "S. 27-29").
Die #acr("RIG") nutzt bereits Python zur Automatisierung anderer interner Prozesse, weswegen Python für die Fortführung der Entwicklung sowie die Integration in die #acr("RIG")-Inbox geeignet ist. Die im Rahmen dieser Arbeit verwendeten Libraries sind in @PythonLibrariesUsed im Anhang dargestellt.

#figure(caption: "Extraktionspipeline des PoCs. Eigene Darstellung.", image("pictures/Extraction_Process.png", width: 100%))<ProcessExtraction>

@ProcessExtraction zeigt den Aufbau der Extraktionspipeline. Jede E-Mail des reduzierten Datensatzes aus @DataPrep wird einzeln in das Python Skript gelesen und ein #acr("LLM")-Prompt mittels Prompt Templating erstellt. Dieser wird an das ausgewählte #acr("LLM") des Orchestration Service gesendet und das zurückgegebene #acr("JSON")-Object der Struktur @ExtractionSchema vom Python Skript verarbeitet. Die extrahierten Daten werden anschließend als Parameter eines GET-Request an die #acr("MXP") gesendet für jede zum extrahierten Produktname zugehörige mögliche Material-#acr("ID") [@SAPBusinessAIProducts]. Enthält die Antwort exakt eine Opportunity, wird ihr Primärschlüssel zur Durchführung eines PATCH-Requests genutzt und die extrahierten Reportingdaten auf der #box([#acr("MXP") gesetzt.])

Im Rahmen des Experiments zur Erreichung der maximalen Datenextraktionsgenauigkeit werden an die zuvor ausgewählten Modelle Prompts mit Text aus dem Validierungsdatensatz gesendet. Verwendet wird ein Basisprompt in Anlehnung an #cite(<moundas2023prompt>, form: "prose"), ein #acrl("CoT")-Prompt sowie ein Self-consistency-Prompt. Diese werden jeweils als Zero-, One- und Few-Shot-Prompt mit Beispielen aus einem getrennten Testdatensatz durchgeführt, um zu prüfen, inwiefern eine Kombination diverser Prompting-Techniken höhere Extraktionsergebnisse erzielt, wie es in vergleichbaren Anwendungsfällen auftritt
  #cite(<Liu2021PromptEngineering>, supplement: "S. 22"). 
Alle Prompts wurden hinsichtlich präziser Zieldefinition und klarer Struktur
  #cite(<ye2024promptengineeringpromptengineer>, supplement: "S. 1-2").
mittels mehrerer #acrpl("LLM") optimiert
  #cite(<Zhou2022AutoPromptEngineering>, supplement: "S. 8-10")
und für alle E-Mail des Validierungsdatensatzes je Modell durchgeführt. 

#set par(leading: 1em)
#figure(caption: "Struktur des verwendete Basisprompts in Anlehnung an " + cite(<moundas2023prompt>, form: "normal", supplement: "S. 2-3"), supplement: "Prompt", kind: "prompt", table(
    columns: (auto, auto),
    inset: 8pt,
    align: horizon,
    table.header(
      [*Rolle*],[*Inhalt*],
    ),
    [*System*],[#align(left, [``` You are a helpful email data extraction assistant. Your task is to extract key elements from an email. ```])],
    [*User*],[#align(left, [``` 
  EXTRACT DATA FROM THE FOLLOWING EMAIL:
    Subject: {{?subject}}
    Body: {{?main_body}} 
    E-Mail-Context: {{?context_body}}
    ```])]
  
    ))<BasecasePrompt>
#set par(leading: 1.5em)

@BasecasePrompt bietet eine Vorlage für den Aufbau eines Prompts, exemplarisch dargestellt am Basisprompt. Die als ```python {{?Parameter}}``` gekennzeichneten Variablen werden durch „Prompt Templating“ des Orchestration Service dynamisch pro E-Mail mit Werten ersetzt. Innerhalb des Prompts wird zwischen dem „Body“, dem aktuellen Inhalt der E-Mail, und dem „E-Mail-Context“, dem Inhalt vorheriger E-Mails derselben Konversation, unterschieden, um im Extraktionsschema in @ExtractionSchema den Fundort einzelner Elemente präzise anzugeben.
  #cite(<moundas2023prompt>, supplement: "S. 3"). 
#acrl("CoT")- [@ChainOfThoughtPrompt], Self-consistency- [@SelfConsistencyPrompt] und Addition einer Beispielstruktur für One- und Few-Shot-Prompt [@PromptExampleStructure] folgen demselben Aufbau und stehen wegen der Leserlichkeit der Arbeit im Anhang.

Im Modelling häufig aufkommende Risiken umfassen Data-Leakage, der Vermischung von Trainings-, Validierungs- und Testdatensatz
  #cite(<van2021talk>, supplement: "S. 4485-4486") 
sowie falsch-validierte Testdaten. Diese werden mittels einer strikten Trennung von Testdaten (Generierung von Beispielen) und Validierungsdaten (Evaluation der #acr("LLM")- und Prompt-Konfiguration) sichergestellt
  #cite(<van2021talk>, supplement: "S. 4486"). 
Die manuelle Extraktion durch den Verfasser wurde vor Evaluierung der Daten durch eine Person des Backoffice-Teams validiert, welche mit der Extraktion von E-Mail-Daten #box([vertraut ist.])

Für jedes der drei in @Modeling ausgewählten Modelle wurden je neun Prompt-Kombinationen auf 100 E-Mails, somit insgesamt 2700 Extraktionen, durchgeführt. Im Folgenden werden die Extraktionsergebnisse evaluiert.

// #pagebreak()
// #v(-2em)

== Evaluation <Evaluation>

#v(-3em)

=== Datenextraktionsanalyse

#figure(caption: "Durchschnittliche Metriken je Feld (aggregiert). Eigene Darstellung.", image("pictures/EV_prec_rec_allmails.png", width: 100%))<EVheatmap_allfields> 

@EVAllfieldsExperimentResultF1 und @EVAllfieldsExperimentResultAccuracy stellen die durchschnittliche F1- und Accuracy-Scores in Form einer Heatmaps je Extraktionsfeld dar, @EVheatmap_allfields die über alle Felder #box([aggregierten Metriken.])

#figure(caption: "Durchschnittlicher F1-Score je Feld. Eigene Darstellung.", image("pictures/allfields_overview_f1.png", width: 100%))<EVAllfieldsExperimentResultF1>

#figure(caption: "Durchschnittliche Accuracy je Feld. Eigene Darstellung.", image("pictures/allfields_overview_accuracy.png", width: 100%))<EVAllfieldsExperimentResultAccuracy>

Die Analyse von @EVAllfieldsExperimentResultF1 und @EVAllfieldsExperimentResultAccuracy zeigt modellspezifische Unterschiede: GPT-4o weist gegenüber den anderen Modellen bei der Extraktion der Felder "opportunity_id" und "analysis" hohe Ergebnisse auf, erzielt aber in der Extraktion anderen Feldern geringe Ergebnisse. Das Modell o1 liefert konsistent hohe Ergebnisse über alle Felder, während o3-mini zwar die höchsten F1- und Accuracy-Scores pro Feld erreicht, jedoch bei "opportunity_id" niedrige Ergebnisse erzielt. Für "customer_name", "analysis" und "on_hold_date" bestehen keine signifikanten Modellunterschiede, ebenso zeigen sich keine Auffälligkeiten in Bezug auf Prompting-Technik.

Die Ergebnisse in @EVheatmap_allfields zeigen einen geringen Spread bei Precision und F1-Score, der sich durch die jeweilige Feldvarianz aus @EVAllfieldsExperimentResultF1 erklären lässt. Das Modell o3-mini erreicht mit einem #acr("CoT") Few-Shot-Prompt die höchsten Ergebnisse (F1: 0,67; Accuracy: 0,77), gefolgt von o1 mit einem Basecase Few-Shot-Prompt (F1: 0,65; Accuracy: 0,74). Die Tendenz geringerer Ergebnisse des Modells GPT-4o bestätigt sich, hinsichtlich der Prompting-Techniken können aus @EVheatmap_allfields keine Erkenntnisse abgeleitet werden.

=== Analyse der Opportunity-Zuordnung

#figure(caption: "Durchschnittliche Metriken (Reportingfelder). Eigene Darstellung.", image("pictures/EV_prec_rec_entry_id.png", width: 100%))<EVheatmap_entry_id>

@EVheatmap_entry_id betrachtet die Evaluationsergebnisse jener Felder, welche auf der #acr("MXP") je Opportunity gesetzt werden, sowie die Metriken für die Entry-#acr("ID"). Die Ergebnisse zeigen einen Zusammenhang zwischen hohen F1-/Accuracy-Scores der Extraktionsfelder und hoher Identifikation der Entry-ID. Auch hier gibt es modellspezifische, aber keine promptspezifischen Auffälligkeiten: o1 weist bei der Identifikation der #acr("MXP")-Opportunity mit einem F1- und Accuracy-Score von 0,95 über drei Konfigurationen hinweg die höchste Rate auf, wobei o3-mini und GPT-4o schlechtere Ergebnisse mit maximaler Genauigkeit von 0,92 bis 0,93 erreichten. Den höchsten F1-Score der Entry-ID erreicht o1 mit drei Prompts, wobei #acr("CoT") (Zero-Shot) die höchste Accuracy bei den #box([Extraktionsdatenfeldern aufwies.])

#figure(caption: "Identifikationsrate (beste Konfiguration). Eigene Darstellung.", image("pictures/EV_groups_extracted_entry_id.png", width: 100%))<EV_percentage_fields>

Im Vergleich zu @DPgroups_entry_id wurde die korrekte Identifikation der Opportunities erheblich verbessert werden, insbesondere, wenn alle Felder Werte enthalten oder die Kunden-#acr("ID") nicht gesetzt ist [@EV_percentage_fields]. Die niedrigere Rate an falsch-positiven Zuordnungen von #acr("MXP")-Opportunities legt nahe, dass viele Einträge, die zuvor als qualitativ hochwertig galten, auf fehlerhaften oder unvollständigen Daten basierten. Dies trifft insbesondere auf die Kunden-#acr("ID") zu, da diese keiner klar erkennbaren Struktur folgt. Diese Annahme wird durch die Beobachtungen aus @EVAllfieldsExperimentResultF1 und @EVAllfieldsExperimentResultAccuracy gestützt. 

Auf Basis dieser Erkenntnisse wird im Folgenden eine Handlungsempfehlung ausgesprochen. Sie beschreibt, welches Modell mit welcher Prompt-Konfiguration im Rahmen der #acr("RIG") zum Einsatz kommen sollte.

#pagebreak()
#v(-2em)
=== Gesamtbetrachtung & Konfigurationswahl <konfigurationswahl>
Folgende Kombinationen aus #acr("LLM") und Prompting-Technik erzielten die besten Ergebnisse in beiden Prozessen:

- *o3-mini #acr("CoT") (Few-Shot)*: Erzielte die höchsten Ergebnisse in der Datenextraktion mit F1: 0,67 und Accuracy: 0,77.
- *o1 #acr("CoT") (Zero-Shot)*: Erreichte  die höchste Accuracy von 0,91 der Extraktionsfelder und eine hohe #acr("MXP")-Zuordnung.
- *o1 Self-consistency (One-Shot)*: Erzielte den höchsten Anteil an korrekt #box([identifizierten Opportunities.])

Anhand der definierten Ziele der #acr("RIG") aus @BusinessUnderstanding muss eine Konfiguration sowohl eine hohe Extraktionsgenauigkeit als auch eine hohe Identifikationsrate des zugehörigen #acr("MXP")-Eintrags aufweisen, da für ein erfolgreiches Reporting einer E-Mail beide Prozesse erfüllt sein müssen. Daher werden im Folgenden beide Prozesse gleich stark gewichtet.

Um dies zu gewährleisten, werden die Ergebnisse der F1- und Accuracy mittels eines gewichteten arithmetischen Mittels bestimmt, bei welcher jedem F1/Accuracy-Score eine #var("k") zugewiesen wird. Hierbei wird der Prozess der Datenextraktion aller acht Felder gleich stark gegenüber dem Prozess der #acr("MXP")-Opportunity-Zuordnung bewertet, für den stellvertretend die Metriken der Entry-#acr("ID") betrachtet wird, da diese nur bei erfolgreicher Identifikation des #acr("MXP")-Eintrags gesetzt wird. Bei vollständiger Attributbetrachtung gilt $#vars("k")=8$. Die folgende Formel wird zu Berechnung der konfigurationsspezifischen Metriken verwendet. Dabei ist $"F1"_"conf"$ der konfigurationsspezifische F1-Score und $"Acc"_"conf"$ die konfigurationsspezifische Accuracy in Abhängigkeit der Gewichtung $#vars("k")$ des #acr("MXP")-Opportunity-Zuordnungsprozess.

$ "F1"_"conf" (k)= (sum_(i=1)^#vars("k") "F1"_i+#vars("k")dot"F1"_"MXP") / (2dot#vars("k")), space space space #vars("k") \u{2208} \u{2115} $
$ "Acc"_"conf" (k)= (sum_(i=1)^#vars("k") "Acc"_i+#vars("k")dot"Acc"_"MXP") / (2dot#vars("k")), space space space #vars("k") \u{2208} \u{2115} $

// Die Resultate sind in @EV_final_result_8 und @EV_final_result_4 dargestellt #cite(<opitz2024closerlookclassificationevaluation>, supplement: "S. 6–7").

#figure(caption: "Durchschnittliche Metriken je Prozess. Eigene Darstellung.", image("pictures/EV_final_results_8.png", width: 100%))<EV_final_result_8>

Wie aus @EV_final_result_8 hervorgeht erzielt o1 in F1- und Accuracy-Score bessere Ergebnisse als GPT-4o und o3-mini. Die beste Konfiguration erzielt o1 mit Self-consistency #box([(One-Shot)-Prompting ($"F1"_"config" (8) = 0,86; "Acc"_"config" (8) = 0,85$).]) Abseits des Modells o1 erreicht o3-mini mit einem #acr("CoT") Few-Shot-Prompt die besten Metriken und kommt somit als Modellalternative #box([in Frage ($"F1"_"config" (8) = 0,84; "Acc"_"config" (8) = 0,84$). ])

// #figure(caption: "Durchschnittl. Metriken [Reporting + Entry-ID]. Eigene Darstellung.", image("pictures/EV_final_results_4.png", width: 100%))<EV_final_result_4>

// Bei isolierter Betrachtung der Reportingqualität (k = 4) verringert sich die Varianz der Ergebnisse, wodurch modellspezifische Unterschiede weniger deutlich ausfallen. o3-mini erzielt mit einem #acr("CoT") Few-Shot Prompt die höchsten Ergebnisse ($"F1"_"config" (4) = 0,79; "Acc"_"config" (4) = 0,78$), gefolgt von o1 Self-consistency #box([One-Shot Prompt ($"F1"_"config" (4) = 0,79; "Acc"_"config" (4) = 0,77$).])

#figure(caption: "Durchschnittliche Metriken je Prozess. Eigene Darstellung.", image("pictures/EV_test_dataset_o1.png", width: 100%))<EV_test_dataset_o1>

Aus @EV_test_dataset_o1 ergibt sich gegenüber der individuellen Modellleistung aus @EV_percentage_fields je Datenqualität vergleichbare Ergebnisse, wodurch die Ergebnisse explorativ als plausibel einzuordnen sind, wobei für eine empirische Verbesserung ein größerer Datensatz notwendig ist 
  #cite(<Kohavi1995>, supplement: "S. 1138-1139").

Damit erzielt o1 bei Analyse beider Abbildungen mit einem Self-consistency One-Shot-Prompt die höchsten Extraktionsergebnisse. o3-mini erreicht mit einem #acr("CoT") Few-Shot-Prompt hingegen die beste #acr("MXP")-Opportunity-Zuordnung und zeigt insgesamt eine vergleichbare Extraktionsqualität, trotz deutlich geringerer Kosten und reduzierter #acr("TTFT"). Für weitere Optimierungsansätze sollten beide Modelle berücksichtigt werden.

#pagebreak()
#v(-2em)

=== Hypothesenvalidierung
Zur Bewertung der in @BusinessUnderstanding definierten Hypothesen werden die F1- und Accuracy Ergebnisse aus @Evaluation betrachtet. Eine Hypothese gilt als:

- *angenommen*: Beide Kennzahlen steigen gegenüber der Referenz (Baseline) erkennbar an, zeigen über alle Modelle hinweg eine positive Entwicklung und der Unterschied ist statistisch signifikant #cite(<huang2025automatedhypothesisvalidationagentic>, supplement: "S. 2-3").
- *teilweise angenommen*: Mindestens eine Kennzahl verbessert sich gegenüber der Baseline, während die andere Metrik stabil bleibt #cite(<huang2025automatedhypothesisvalidationagentic>, supplement: "S. 2-3"). Der Unterschied muss nicht statistisch signifikant sein, solange keine gegenläufigen Entwicklungen zwischen den Modellen auftreten
  #cite(<wampold1990hypothesis>, supplement: "S. 363").
- *abgelehnt*: Die Veränderung stagniert oder es treten sich widersprechende Ergebnisse auf. Ebenso wird die Hypothese abgelehnt, wenn der Unterschied statistisch nicht aussagekräftig ist
  #cite(<huang2025automatedhypothesisvalidationagentic>, supplement: "S. 2").

Ein Effekt wird in dieser Arbeit als statistisch signifikant klassifiziert, wenn das #varl("\u{03B1}") $#vars("\u{03B1}") < 0,05$ beträgt
  #cite(<loftus2022hypothesis>, supplement: "S. 163-185")
  #cite(<Gorriz_2022>, supplement: "S. 6").
Zur Bestimmung dieser Wahrscheinlichkeit wurde ein gepaarter, nicht-parametrischer Bootstrap-Ansatz nach #cite(<Efron1993>, form: "prose") verwendet, bei dem F1- und Accuracy-Metriken wiederholt berechnet und deren Abweichungen vom arithmetischen Mittel analysiert wurden. Signifikanz liegt vor, wenn die Gesamtabweichung kleiner als 0,05 ist.
  #cite(<Efron1993>, supplement: "S. 5–8")

// Zwei Effekte gelten als statistisch signifikant bei einem α-Niveau von 0,05, wenn sich deren Konfidenzintervalle nicht überlappen (vgl. Dietterich, 1998; Demšar, 2006).

@EVIncluenceParameters zeigt die Auswirkungen der Parameter Modell, Prompt und Beispielumfang. Einträge mit der Notation $*$ gelten als statistisch signifikant. Die Ergebnisse werden als Hauptquelle für die Annahme bzw. Ablehnung der #box([Hypothese verwendet.])

#figure(caption: "Auswirkung von Prompt/LLM. Eigene Darstellung.", image("pictures/EV_influence_parameters.png", width: 100%))<EVIncluenceParameters>

Im Folgenden erfolgt die Annahme bzw. Ablehnung der Hypothesen 1-6 auf Basis der Datenextraktion aller Felder:

- *Hypothese 1 - One-Shot > Zero-Shot*: Die Ergebnisse aus @EVIncluenceParameters zeigen eine statistisch signifikante Reduktion des F1 um 1,42 #acr("pp") und der Accuracy um 0,63#acrs("pp"). Da keine Verbesserung vorliegt, wird diese #box([Hypothese *abgelehnt*.])

- *Hypothese 2 - Few-Shot > Zero-Shot und One-Shot:* Gegenüber Hypothese 1 weist die Anwendung von Few-Shot-Prompting marginale Verbesserungen gegenüber Zero-Shot von unter 1#acrs("pp"), wobei eine signifikante Verbesserung gegenüber One-Shot zu erkennen ist. Aufgrund fehlender Signifikanz aller Resultate wird die Hypothese *teilweise angenommen*.

- *Hypothese 3 - Chain-of-Thought > Basisprompt*: Gegenüber dem Basisprompt zeigt #acrs("CoT") eine geringe Verschlechterung der Metriken weswegen die Hypothese *abgelehnt* wird.

- *Hypothese 4 - Self-consistency > Basisprompt*: Gegenüber Hypothese 3 gibt es bei Anwendung von Self-consistency-Prompting keine signifikante Verbesserung, weswegen die Hypothese *abgelehnt* wird.

- *Hypothese 5 - Reasoning Modell > Non-Reasoning-Modell*: Wie aus @EVIncluenceParameters ersichtlich zeigt die Verwendung von o1 und o3-mini gegenüber GPT-4o einen signifikanten Zuwachs der Accuracy von 4,33-5,28#acrs("pp"), der F1-Score zeigt marginale Veränderung. Aufgrund dessen wird die Hypothese *teilweise angenommen*.

- *Hypothese 6 - Größere Modelle > Kleinere Modelle*: Wie aus @EVIncluenceParameters und Hypothese 5 herausgehen gibt es eine Extraktionsverbesserung zwischen o1 und o3-mini, wobei GPT-4o eine signifikante Verschlechterung der Accuracy gegenüber o3-mini aufweist. Daher wird die Hypothese *abgelehnt*.

Insgesamt wurden aus allen sechs Hypothesen vier Hypothesen abgelehnt und zwei Hypothesen teilweise angenommen. Eine Analyse zeigt, dass mithilfe der Modellwahl die Datenextraktion optimiert werden kann, die Anwendung von Prompt Engineering aber keine signifikante Steigerung der Metriken aufweist.

#pagebreak()
#v(-2em)
== Deployment <Deployment>
Die Ergebnisse aus @Modeling zeigen eine erfolgreiche Steigerung der Evaluationsmetriken gegenüber @DUExtrResult. Beide in @konfigurationswahl ausgewählten Konfigurationen erreichen die in @BusinessUnderstanding für eine Produktivnahme definierten Vorgaben der #acr("RIG") von mindestens 70% Genauigkeit, einer Übereinstimmung der manuellen #acr("MXP")-Identifikation von 95% Genauigkeit [@EVheatmap_entry_id] und einen Anteil falsch-positiv identifizierter Opportunities von 5% [@EV_percentage_fields]. Damit erfüllt der #acr("PoC") die Vorgaben der #acr("RIG") und ein Deployment mit Anbindung an die #acr("RIG")-Inbox kann durchgeführt werden. Es empfiehlt sich ein schrittweises Vorgehen, bei dem die Änderungen auf der #acr("MXP") zunächst als Vorlage gespeichert werden und eine Begutachtung durch die #acr("RIG") vor dem Reporting erfolgen muss.

Nächste Schritte umfassen die Validierung der Ergebnisse auf einem zeitlich aktuelleren Datensatz, um Abweichungen durch die Datengrundlage auszuschließen #cite(<salman2019overfittingmechanismavoidancedeep>, supplement: "S. 2"). Durch folgende Maßnahmen kann die #acr("RIG") die Extraktionsqualität vor der produktiven  #box([ Implementierung steigern:])

- *Anpassung der E-Mail-Kampagnen*: Die #acr("RIG") kann durch Hinzugabe von #acr("MXP")-Identifikatoren wie die #acr("CRM")-Account- und #box([Opportunity-#acr("ID")]) die Datenqualität zukünftiger E-Mails durch die Anpassung ihrer #box([E-Mail-Kampagnen steigern [@EV_percentage_fields].])
- *Konkretisierung der Reportingdaten*: Durch die Konkretisierung der Reportingwerte, wie z.B. dem Status aus @ActivationStatus im Anhang oder einem #acr("RIG")-Kontakt innerhalb der E-Mail, wird die korrekte Identifizierung der #box([Daten erleichtert.])

Nach erfolgreicher Validierung der Ergebnisse übernimmt die produktive Entwicklung sowie Wartung und Support die #acr("RIG"). Diese Arbeit dient als Dokumentation der bisherigen Entwicklung. 

= Schlussbetrachtung <Schlussbetrachtung>

#v(-2.5em)

== Zusammenfassung der Ergebnisse
Eine Analyse der Ergebnisse der Modellierung zeigt, dass die Datenextraktion durch die in @Optimierungsverfahren vorgestellten Ansätze und damit verbunden das Setzen von strukturierten E-Mail-Kommunikationsdaten verbessert wird. Reasoning-Modellen wie o1 und o3-mini steigern die Extraktionsgenauigkeit, eine Verbesserung der Ergebnisse durch Prompt Engineering konnte in dieser Arbeit nicht #box([nachgewiesen werden [@EVIncluenceParameters].])

Die von der #acr("RIG") in @BusinessUnderstanding definierten #acrpl("KPI") konnten im Rahmen des #acr("PoC") erreicht werden. Die besten Ergebnisse erzielte das Modell o1 mit einem Self-consistency One-Shot-Prompt mit einem F1-Score von 0,64, einer Genauigkeit von 0,74 und einer #acr("MXP")-Opportunity-Identifikationgenauigkeit #box([von 95% [@EVheatmap_allfields, @EVheatmap_entry_id].])

Aufgrund der hohen Variation der Ergebnisse je Modellkonfiguration und einer fehlenden statistischen Aussagefähigkeit durch einen geringen Datensatz spricht sich die Arbeit für eine Validierung der Ergebnisse auf einem größeren, zeitlich aktuelleren Datensatz aus. Darüber hinaus soll die #acr("RIG") durch Anpassung ihrer E-Mail-Kampagnen die Datenqualität je E-Mail erhöhen, um die #acr("MXP")-Identifikationsrate weiter zu steigern.

Nach Erfüllung der definierten Kriterien übernimmt die #acr("RIG") die produktive Implementierung des #acr("PoC") sowie Aufgaben im Bereich Wartung und Support. Aufgrund der erfolgreichen Steigerung der Datenqualität empfiehlt die Arbeit, dass die #acr("RIG") Maßnahmen zur Verbesserung der Datenqualität fortsetzt.

// Aufgrund der Identifikation einer zu hohen Zahl falsch positiv identifizierter Einträge wird sich gegen eine sofortige Produktivnahme ausgesprochen und für eine weitere Optimierung der Datenextraktion. Nächste Schritte umfassen die Prüfung und Verbesserung der Datengrundlage und -qualität, die Verbesserung des #acr("MXP")-Algorithmus sowie die Durchführung weiterer Experimente #box([hinsichtlich leistungsfähigerer #acrpl("LLM").])

== Einordnung der Ergebnisse
Die erzielten Ergebnisse aus @Evaluation reihen sich in die aktuelle Literatur zu #acr("LLM")-basierter Datenextraktion ein.
Die erreichte Genauigkeit von 74% ist vergleichbar mit der Genauigkeit in anderen Bereichen 
  #cite(<Wang2024>, supplement: "S. 5167 - 5174") 
und zeigt ein ähnliches Verhalten beim Einsatz von Reasoning-Modellen 
  #box([#cite(<brokman2025benchmarkendtoendzeroshotbiomedical>, supplement: "S. 9-12").])
Diese Arbeit erzielt, entgegen Datenextraktionen aus anderen Bereichen
  #box([#cite(<srivastava2024medpromptextract>, supplement: "S. 8-9")
  #cite(<Polat2024PromptEngineering>, supplement: "S. 7-9")])
keine signifikante Genauigkeitsveränderung durch die Anwendung von Prompt Engineering. Mögliche Ursachen dieser Abweichung, wie anwendungsspezifische Faktoren oder Fehler bei der Modellierung, können durch eine wiederholte Durchführung des Experiments sowie die Anpassung der Prompts #box([identifiziert werden.])

== Herausforderungen und Limitationen <limitations>
Die Ergebnisse aus @Evaluation unterliegen Limitation hinsichtlich ihrer Aussagefähigkeit durch Herausforderungen bei Erhebung und Interpretation der Daten.

Der zur Modellierung verwendete Datensatz, bestehend aus 125 E-Mails, aufgeteilt in Trainings-, Validierungs- und Testdatensatz, weist Herausforderungen auf: im Vergleich zu anderen Datenextraktionsanalysen
  #cite(<srivastava2024medpromptextract>, supplement: "S. 3-4")
  #cite(<brokman2025benchmarkendtoendzeroshotbiomedical>, supplement: "S. 8-9")
ist der Validierungsdatensatz klein und besitzt eine geringe Datenvarianz, wodurch die Ergebnisse dieser Arbeit nicht als Optimierung und empirisch angesehen werden können, sondern als explorative Untersuchung beschränkt auf die Domäne der E-Mail-Kommunikation der #acr("RIG")
  #cite(<salman2019overfittingmechanismavoidancedeep>, supplement: "S. 1-2"). 
Darüber hinaus können bei der manuellen Extraktion Fehler durch den Verfasser, trotz Validierung eines #acr("RIG")-Mitarbeiters, Fehler auftreten, die die Evaluationsergebnisse verzerren und Hypothesen zu Unrecht abgelehnt werden
  #cite(<srivastava2024medpromptextract>, supplement: "S. 9-11").

Weitere Herausforderungen ergeben sich durch die Verwendung von #acrpl("LLM") gegenüber regelbasierten Verfahren: durch das persistierende Risiko falsch extrahierter Daten sowie Halluzinationen ist ein angestrebter Anteil von 0% falsch-positiver #acr("MXP")-Opportunity-Zuordnung erschwert möglich
  #cite(<Islam2024>, supplement: "S. 11-12"). 
Des Weiteren wurde im Rahmen dieser Arbeit je Prompting-Technik nur ein Prompt [@ChainOfThoughtPrompt, @SelfConsistencyPrompt] generiert, wodurch Fehler bzw. modellspezifische Bias auftreten können
  #cite(<Zhou2022AutoPromptEngineering>, supplement: "S. 8-10").
Im Rahmen einer anderen Arbeit kann dies untersucht werden und Methoden wie #acr("LLM")-Stacking zur Validierung der Ergebnisse #box([eingesetzt werden
  @wolpert1992stacked.])

Die Interpretation der Ergebnisse ist limitiert durch die in dieser Arbeit verwendeten Tools: die Verwendung des Orchestration Service des SAP #acr("GenAI") Hub limitiert die einsetzbaren Modelle auf den Anbieter OpenAI
  #cite(<xu2023tool>, supplement: "S. 1")
  #cite(<Li2024LLMSAP>), 
wodurch ein hohes Risiko von Vendor-Lock-In besteht, was die Ergebnisse verzerren kann
  #cite(<choi2025advantages>, supplement: "S. 3-7"). 
Zur Validierung der Ergebnisse ist eine erneute Durchführung mit Modellen weiterer Anbieter empfehlenswert, um dieses Risiko zu minimieren.

Weitere Limitationen treten durch die zu extrahierenden Daten auf: in dieser Arbeit wurden die in @ExtractionSchema dargestellten Felder extrahiert. Wie aus @EVAllfieldsExperimentResultF1 und @EVAllfieldsExperimentResultAccuracy ersichtlich variieren die Metriken einer Modell- und Prompting-Konfiguration stark je Feld, wodurch die in dieser Arbeit erhobenen Evaluationsergebnisse für andere Anwendungsfälle erneut evaluiert werden müssen.

Abschließend ist die Extraktion von Reportingdaten bislang limitiert auf die Extraktion von Betreff und Inhalt der E-Mail. Eine Analyse von angehängten Dateien sowie strukturelle Informationen wie Formatierung oder eingebettete Hyperlinks wird im Rahmen des #acrpl("PoC") nicht unterstützt, bietet aber eine Initiative für #box([weitere Forschung.])

#pagebreak()
#v(-2em)
== Ausblick
Die in @ZielUndGang definierten Forschungsfragen konnten im Rahmen der Entwicklung eines #acrpl("PoC") beantwortet werden. Dabei wurde an mehreren Stelle Potential für weitere Forschung identifiziert. Diese können im Rahmen einer produktiven Entwicklung durch die #acr("RIG") miteinbezogen werden, um die Extraktionsqualität weiter nachhaltig zu verbessern. Diese umfassen:

- *Modellauswahl*: Durch die Veröffentlichung weiterer Modelle diverser Anbieter, die die Leistung der alten Modelle übertreffen, bieten diese Potential für bessere Extraktionsergebnisqualität in der Zukunft #cite(<huang2024largelanguagemodelmeets>, supplement: "S. 17-19").
- *Hyperparameter-Tuning*: Eine Verbesserung der Extraktionsqualität anhand von Hyperparametern erzielt in anderen Datenextraktionsaufgaben eine verbesserte Extraktionsgenauigkeit  #cite(<Du2025temperature>). Der SAP #acr("GenAI") Hub soll in Zukunft das Setzen von Temperatur und Tokenlimit der Modelle o1 und o3-mini unterstützen
- *Algorithmus zur #acr("MXP")-Identifikation*: Bislang werden die extrahierten Daten in Form von Parametern an einen #acr("MXP")-GET-Request angehängt. Anhand eines Algorithmus, welcher falsch extrahierte Daten eliminiert und Duplikate auf der #acr("MXP") identifiziert, kann die Rate der an das #acr("MXP") gesendeten Einträge #box([verbessert werden.])
- *Einbindung mehrerer Datenquellen*: Wie in @limitations erläutert können zur Erhöhung der Extraktionsrate weitere Datenquellen wie bspw. der Anhang einer E-Mail sowie über Microsoft Outlook hinausgehende Datenquellen genutzt werden, um eine höhere Datenqualität aufzuweisen.

Hierbei sollten die in @limitations ausgeführten Herausforderungen und Limitationen beachtet werden, sowie ein größerer Datensatz verwendet werden, um die Aussagefähigkeit der Ergebnisse zu verbessern.

]