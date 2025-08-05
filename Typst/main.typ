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

= Methodik


= Grundlagen <Grundlagen>
Im Folgenden werden theoretische Grundlagen erläutert, die für ein tieferes Verständnis in den Folgekapiteln vorausgesetzt werden.

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

]