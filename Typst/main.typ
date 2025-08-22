#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl

#let main = [

= Einleitung <Einleitung>
Aufbauend auf de Grundlagen von #cite(<shannon1948mathematical>, form: "prose") und der Forschung von #cite(<Vaswani2017SelfAttention>, form: "prose") zu neuronalen Netzen, die kontextabhängige Informationen aus komplexen Eingaben nutzen können, um korrekte Modellausgaben zu generieren, ist ein neues Zeitalter von #acr("KI"), auf Englisch als #acr("AI") bekannt, eingetreten. Diese Entwicklungen führten zu erheblichen Fortschritten in der Integration von #acr("AI")-Technologien in vielfältige Anwendungsfelder, insbesondere in betriebswirtschaftliche Prozesse #cite(<srivastava2024medpromptextract>, supplement: "S. 8-9"). Durch #acr("AI")-gestützte Dienste wird es Unternehmen ermöglicht, Informationen aus Daten zu schließen, aus denen zuvor keine Erkenntnisse gewonnen #box([werden konnten 
  #cite(<McKinsey2023EconomicAI>)
  #cite(<Zhao2023>, supplement: "S. 2-3").])

Im Kontext von betriebswirtschaftlichen Prozessen liegen Daten in unterschiedlichen Formaten vor. Im Allgemeinen können diese Datenformate in strukturierte, beispielweise in tabellarischer Form vorliegende, und unstrukturierte, beispielweise in Freitexten vorkommende, Daten differenziert werden, wobei die Vielzahl der Daten in strukturierter Form vorliegt.
  #cite(<johnson2016mimic>, supplement: "S. 1-2").
  #cite(<McKinsey2023EconomicAI>). 
#acrpl("LLM") sind generative Sprachmodelle, die aus unstrukturierten Modelleingaben anhand von Wahrscheinlichkeiten eine natürlichsprachige Ausgabe produzieren
  #cite(<Zhao2023>, supplement: "S. 2"). 
Seit die Veröffentlichung von OpenAIs 'ChatGPT' im Jahr 2022 sind #acrs("LLM") in den Fokus der Öffentlichkeit gerückt und haben sich in den letzten Jahren zu einem der am häufigsten eingesetzten #acr("AI")-Modellarten entwickelt
  #cite(<McKinsey2023EconomicAI>).
Der Durchbruch für #acr("AI")-Modelle zur Verarbeitung strukturierter Daten blieb #box([zunächst aus.])

#acrpl("LGM") werden aktuell als vielversprechender Ansatz diskutiert, um eine präzisere Verarbeitung von strukturierten Daten zu ermöglichen. Analog zu #acrpl("LLM") bezeichnet der Begriff #acr("LGM") Graphmodelle, die aufgrund großer Modellkapazität und Vortraining auf umfangreichen Graphdaten neuartige Fähigkeiten im Graphbereich zeigen sollen 
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1"). 
Graphen sind eine fundamentale Datenstruktur zur Repräsentation von Relationen zwischen Entitäten, beispielweise in Form von Wissensgraphen oder Datenbankrelationen, deren effiziente Auswertung für viele Domänen entscheidend ist. 
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1-2").
#acrpl("LGM") basieren auf den Fortschritten von #acrpl("GNN") als auch des Transfer-Lernens mit großen Modellen. #acrpl("GNN") stellen den bislang de-facto Standard zur Verarbeitung von Graphen dar
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1-4").

In dieser Arbeit sollen folgende Forschungsfragen adressiert werden:

1. Welche Architekturen existieren von #acrpl("LGM") und an welchen weiteren Ansätzen #box([wird geforscht?])
2. Wie kann die Leistung und Anwendbarkeit eines #acr("LGM")-Modells verbessert werden?

Im Rahmen einer Literaturrecherche werden insgesamt vier Datenbanken auf jeweils zehn relevante wissenschaftliche Arbeiten untersucht, die sich mit der Verarbeitung von strukturierten Daten durch #acrpl("LGM") befassen. Dabei wird spezifisch auf die Anwendungsmöglichkeiten eingegangen, #acrpl("LGM") zu optimieren und mehrere Ansätze diskutiert.
Diese Arbeit zielt darauf ab, einen Einblick in den aktuellen Stand der Forschung zu geben und mögliche zukünftige Entwicklungen in diesem Bereich aufzuzeigen.


= Methodische Vorgehensweise des Reviews <Methodik>
Dieses Review folgt einem vorab fixierten Protokoll entlang etablierter Leitlinien für systematische Literaturübersichten in Wirtschaftsinformatik/SE (Planung–Durchführung–Bericht) 
  #cite(<Kitchenham2007SLR>, supplement: "S. 5–7, 18–26").
Untersucht werden die in @Einleitung definierten Forschungsfragen.

Um den State-of-the-Art von #acrpl("LGM") zur Verarbeitung strukturierter Daten zu erheben, wurde eine systematische Literaturrecherche durchgeführt. Als Quellen wurden wissenschaftliche Datenbanken und Repositorien wie arXiv, ResearchGate, ACM Antology und ACL Digital Library herangezogen, da diese in der Domäne der Wirtschaftsinformatik sowie #acr("KI") weit verbreitet und allgemein zugänglich für Studenten der DHBW Mannheim sind. Die Suche konzentrierte sich auf Veröffentlichungen nach der Veröffentlichung von #cite(<Vaswani2017SelfAttention>, form: "prose"), der erstmals das Konzept von Selbstaufmerksamkeitsmechanismen vorstellte, da diese ein neues Kapitel in der Forschung von #acr("KI") eingeleitet hat. durch Peers begutachtete Veröffentlichungen (NeurIPS, ICML, KDD, ICLR u. a.) werden im Review höher gewichtet als nicht durch Peers begutachtete Beiträge
  #cite(<Kitchenham2007SLR>, supplement: "S. 18–19").

Folgende Begriffe werden in den Datenbanken gesucht, um relevante wissenschaftliche Arbeiten zu identifizieren:

- “#acrf("LGM")”
- “#acrf("GNN")”
- "#acr("LGM")-Architectures"
- “Relational Deep Learning”
- “Graph Representation Learning”
- “Graph pre-training”
- “Graph foundation model”

Durch Kombination dieser Begriffe konnten einschlägige Arbeiten identifiziert werden, beispielsweise führte die Suche nach “Graph meets LLM” zur Entdeckung eines Überblicksartikels von #cite(<zhang2023graphmeetsllmslarge>, form: "prose"), während “graph in-context learning” auf neuere Ansätze wie #cite(<hu2025letsaskgnnempowering>, form: "prose") und #acr("PRODIGY") von #cite(<huang2023prodigyenablingincontextlearning>, form: "prose") verwies. Die Begriffe sind bewusst auf Englisch formuliert, da die Primärliteratur überwiegend englischsprachig ist. 

Um den Umfang dieser Arbeit zu wahren, werden Ausschlusskriterien definiert. Eingeschlossen werden Arbeiten, die explizit großskalige #acrpl("LGM") zum Thema haben, insbesondere welche neue Architekturen betrachten, wobei Studien zu klassischen #acrpl("GNN") ohne Bezug zur Modellskalierung oder zum #acr("LLM")-Kontext ausgeschlossen werden. Um die neusten Erkenntnisse zu erfassen, werden Arbeiten vor 2018 ausgeschlossen, da sich nach der Implementierung von Aufmerksamkeitsmechanismen durch #cite(<veličković2018graphattentionnetworks>, form: "prose") aus dem Jahr #cite(<veličković2018graphattentionnetworks>, form: "year") die Einsatzmöglichkeiten von #acrpl("LGM") fundamental verändert haben.
  #cite(<zhang2023graphmeetsllmslarge>, supplement: "S. 2").

Nachdem eine Kernliste von Publikationen zusammengestellt war, erfolgt eine inhaltliche Prüfung der wissenschaftlichen Veröffentlichungen. Die daraus gewonnenen Erkenntnisse wurden kritisch synthetisiert und werden im folgenden #box([Kapitel dargestellt.]) Im Folgenden werden die Erkenntnisse der Literaturrecherche zusammengefasst und die Forschungsfragen beantwortet.

= Ergebnisse der Literaturrecherche
Die Literaturrecherche ergab insgesamt 40 relevante wissenschaftliche Arbeiten, die sich mit der Verarbeitung von strukturierten Daten durch #acrpl("LGM") und #acrpl("LLM") befassen. Diese Arbeiten wurden in einem Review anhand der vorab definierten Ausschlusskriterien evaluiert. Die Ergebnisse der Filterung anhand der definierten Ausschlusskriterien aus @Methodik sind in @LiteratureReviewResults im Anhang dargestellt und umfassen zehn wissenschaftliche Publikationen.

In den folgenden Kapiteln wird zunächst auf die Entwicklung von #acrpl("LGM") eingegangen, um Kontext und Verständnis für weitere Kapitel zu schaffen. Anschließend werden die State-of-the-Art Modellarchitekturen für #acrpl("LGM") vorgestellt und voneinander abgegrenzt, um ein umfassendes Verständnis der aktuellen Entwicklungen in diesem Bereich zu vermitteln und Gegenpositionen zur Optimierung eines #acrpl("LGM") zu vergleichen. Abgeschlossen wird das Kapitel mit einer Zusammenfassung der Ergebnisse.

== Entwicklung von Large Graph Models <Entwicklung>
Ein Graph ist eine Datenstruktur, die aus Knoten (Entitäten) und Kanten (Beziehungen zwischen Entitäten) besteht und zur Darstellung von relational strukturierten Daten verwendet wird. 
  #cite(<fey2023relationaldeeplearninggraph>, supplement: "S. 1-2").
Diese Knoten stehen i.d.R. in einer Subjekt-Prädikat-Objekt Beziehung zueinander
  #cite(<huang2023prodigyenablingincontextlearning>, supplement: "S. 3"). 
Ein Beispiel hierfür ist die Aussage "Berlin ist die Hauptstadt von Deutschland", welche in einem Graphen durch die Knoten "Berlin" und "Deutschland" sowie die Kante "ist die Hauptstadt von" dargestellt werden kann.

Vor der Einführung von #acrpl("GNN") wurden Informationen aus relational strukturierten Daten i.d.R. mit traditionellen Machine-Learning-Verfahren wie #acr("kNN"), bei welcher Datenpunkte als Vektoren in einem hochdimensionalen Raum dargestellt werden, verarbeitet. Diese Verfahren sind jedoch nicht in der Lage, neue Informationen zu verarbeiten, sondern nur bekannte Datenpunkte zu klassifizieren
  #cite(<Cunningham_2021_kNN>, supplement: "S. 1-2"). 


#figure(caption: "Funktionsweise eines GNNs " + cite(<fey2023relationaldeeplearninggraph>, form: "normal"), image("pictures/RelBench.png", width: 100%))<RelBench>

Den Grundbaustein legten #cite(<Scarselli2009firstgnn>, form: "prose") im Jahr #cite(<Scarselli2009firstgnn>, form: "year") mit der Einführung von #acrpl("GNN"), die es ermöglichen, Graphen in neuronalen Netzen zu verarbeiten und erste Vorhersagen zu treffen, indem Datenpunkte nicht mittels Suchalgorithmen aus einer bekannten Liste abgerufen werden, sondern mittels einer Funktion diese dynamisch generiert werden
  #cite(<Scarselli2009firstgnn>, supplement: "S. 2"). 
@RelBench stellt die Funktionsweise dar. Zur Verarbeitung von relational strukturierten Daten müssen diese zunächst in Graphen umgewandelt werden (b), die die Relationen zwischen Tabellen in Form von Knoten und Kanten brücksichtigt
  #cite(<fey2023relationaldeeplearninggraph>, supplement: "S. 3"). 
Diese können über ein neuronales Netz (c) in Vektoren konvertiert und somit verarbeitet werden, um mittels einer Funktion eine Ausgabe zu generieren, welche in Form eines Datenpunktes ausgegeben wird.
  #cite(<hamilton2017inductive>, supplement: "S. 1-2")

Die Entwicklung von #acrpl("GNN") führte zu einer Vielzahl von Architekturen, die sich auf verschiedene Anwendungsfälle konzentrierten. 
GraphSAGE aus dem Jahr #cite(<hamilton2017inductive>, form: "year") von #cite(<hamilton2017inductive>, form: "prose") ist eine der ersten #acrpl("GNN")-Architekturen, welche im Gegensatz zu traditionellen #acrpl("GNN")-Architekturen einen induktiven Ansatz nutzt, um Graphen zu verarbeiten. Dies bedeutet, dass sie in der Lage ist, neue Knoten und Kanten zu verarbeiten, die nicht im Trainingsdatensatz enthalten sind, indem es bestehende Knoten nicht als Datenpunkte, sondern als Funktionen auffasst. Dadurch ist es möglich, anstatt einer Abfrage bestehender Informationen eine Wahrscheinlichkeit zu berechnen. Erweitert wurde diese Architektur von #cite(<veličković2018graphattentionnetworks>, form: "prose") im Jahr #cite(<veličković2018graphattentionnetworks>, form: "year"), indem Aufmerksamkeitsmechanismen aus #cite(<Vaswani2017SelfAttention>, form: "prose") in Graphen eingeführt wurden, um einen stärkeren Fokus auf die Relationen zwischen Entitäten zu legen. Diese Architektur, bekannt als #acrpl("GAN"), beziehen im Gegensatz zu #acr("kNN") nicht nur die nächsten k Nachbarn eines Knotens in die Verarbeitung ein, sondern beziehen auch weitere, nicht direkt durch Kanten zusammenhängende Knoten in die Verarbeitung ein, um eine höhere Genauigkeit zu erzielen. Diese Architekturen schaffen die Basis für die Entwicklung von #acrpl("LGM")
  #cite(<veličković2018graphattentionnetworks>, supplement: "S. 3-4").

#acrpl("LGM") sind eine Weiterentwicklung traditionellen #acrpl("GNN"), die auf Basis von #acrpl("LLM")-Architekturen entwickelt wurden und in spezifisch ausgewählten Domänen in Benchmarks wie "RelBench", ein Python-Paket der Stanford Univerity, welches zur Umsetzung von #acr("RDL") in #acrpl("GNN") verwendet wird, höhere Ergebnisse als reguläre #box([#acrpl("GNN") erzielen
  #cite(<fey2023relationaldeeplearninggraph>, supplement: "S. 5-7")
  #cite(<zhang2023graphmeetsllmslarge>, supplement: "S. 1-2").])
Sie umfassen oft ein mehrschichtiges Netzwerk mit Millionen bis Milliarden von Parametern, die auf umfangreichen Graphdaten vortrainiert wurden, um eine Vielzahl von Aufgaben zu bewältigen. 
  #cite(<zhang2023graphmeetsllmslarge>, supplement: "S. 1-2").

== State-of-the-Art Modellarchitekturen <Modellarchitekturen>
Unter der Vernetzung mehrerer #acrpl("GNN") zu einem großen, mehrschichtigen Modell mit hoher Parameteranzahl spricht man von einem #acrpl("LGM")
  #cite(<fey2023relationaldeeplearninggraph>, supplement: "S. 1-2"). 
Die Funktionsweise, wie diese Schichten miteinander interagieren wird durch die #acr("LGM")-Architektur bestimmt. Oft nutzen die Fortschritte in der #acrpl("LLM")-Architektur, um die Verarbeitung von Graphen zu verbessern und durch erhöhte Parametergröße und Trainingsvolumen eine höhere Genauigkeit zu erzielen
  #cite(<hu2025letsaskgnnempowering>).
Darüber hinaus erlauben diese durch die Integration von #acrpl("LLM")-Komponenten eine einfache Interaktion mit den Modell durch Prompts, ähnlich wie bei #acrpl("LLM"), wodurch sie für Endbenutzer ohne technische Kenntnisse zugänglicher werden
  #cite(<hu2025letsaskgnnempowering>, supplement: "S. 1-2").

In der Forschung gibt es mehrere Ansätze, Performance von #acrpl("LGM") zu verbessern. Diese Ansätze können in zwei Kategorien unterteilt werden:

1. Architekturen, welche die Qualität der Ausgaben eines #acrpl("LGM") in einem spezifischen Anwendungsfall verbessern
2. Architekturen, welche ein #acrpl("LGM")-Modell auf eine Vielzahl von Anwendungsfällen anwendbar machen

Im Folgenden werden Ansätze beider Kategorien vorgestellt und deren Funktionsweise erläutert und die jeweiligen Vorteile durch deren Implementierung dargestellt. Abschließend wird diskutiert, wie zukünftige #acrpl("LGM")-Architekturen von diesen Ansätzen profitieren können und in welche Richting sich die Forschung entwickeln könnte.

#pagebreak()

=== Ansätze zur Verbesserung der Leistungsfähigkeit <Leistungsbasierte_Architekturen>
Eine bekannte Schwäche von #acr("AI")-Modellen liegt in der Datenqualität, auf welcher das Modell trainiert wurde.
Ein #acr("LGM") kann nur so gut sein wie die Daten, auf denen es trainiert wurde, welche i.d.R. in unzureichenden Mengen vorliegen oder mit hohen Erstellungskosten verbunden sind.
Der Fokus der Literatur liegt daher auf der Verbesserung der Trainingsdaten sowie der Reduktion manueller Eingriffe in den Trainingsprozess.
  #cite(<Liu2021PromptEngineering>, supplement: "S. 1-2")

#cite(<you2021graphcontrastivelearningaugmentations>, form: "prose") aus dem Jahr #cite(<you2021graphcontrastivelearningaugmentations>, form: "year") stellen einen Ansatz vor, der die Qualität von #acrpl("GNN")-Modellen durch Kontrastives Lernen verbessert. Dieser Ansatz nutzt Augmentierungen, um verschiedene Sichten auf denselben Graphen zu erzeugen und diese dann zu vergleichen, um die Qualität der Repräsentationen zu verbessern. Dies ermöglicht es, die Robustheit und Generalisierungsfähigkeit des Modells zu erhöhen.
Dieser Ansatz wird in der Literatur als "Graph Contrastive Learning" bezeichnet und hat sich als effektiv erwiesen, um die Leistung von #acrpl("GNN")-Modellen zu verbessern
  #cite(<you2021graphcontrastivelearningaugmentations>, supplement: "S. 1-2").

#cite(<Xia_2022SIMGRACE>, form: "prose") aus dem Jahr #cite(<Xia_2022SIMGRACE>, form: "year") erweiterten diesen Ansatz, indem sie #acr("SimGRACE") vorstellt, die die Qualität von #acrpl("GNN")-Modellen durch Kontrastives Lernen ohne Augmentierungen verbessert. #acr("SimGRACE") erzeugt Permutationen eines Graphen, indem es zwei Sichten auf denselben Graphen generiert
Dadurch ist keine Augmentierung der Daten notwendig, was die Effizienz des Trainingsprozesses erhöht und falsche Augmentierung des Graphen vermeidet.
Dieser Ansatz hat sich als effektiv erwiesen, um die Leistung von #acrpl("GNN")-Modellen zu verbessern und die Robustheit gegenüber Rauschen und Störungen #box([zu erhöhen.
  #cite(<Xia_2022SIMGRACE>, supplement: "S. 1-4")])

=== Ansätze zur Erhöhung der Anwendungsvielfalt <Allgemeine_Architekturen>
Damit ein #acrpl("LGM") in einer Vielzahl von Anwendungsfällen eingesetzt werden kann, muss dieses eine ausreichend hohe Qualität in einer breiten Anwendungsvielfalt aufweisen. Folgende Ansätze werden in der Literatur diskutiert:

- *Vereinheitlichung der Eingabeformate*: Mittels einer einheitlichen Schnittstelle zur Interaktion und zum Training eines #acrpl("LGM") wird die Nutzung solcher Modelle vergleichbar zu #acrpl("LLM"), somit intuitiver für Endanwender.
- *Breite Wissensbasis*: Durch eine größere Wissensbasis kann ein Modell vielfältig eingesetzt werden, vergleichbar mit modernen #acrpl("LLM").

In der Veröffentlichug von #cite(<huang2023prodigyenablingincontextlearning>, form: "prose") aus dem Jahr #cite(<huang2023prodigyenablingincontextlearning>, form: "year") wird ein Ansatz namens #acr("PRODIGY") vorgestellt, der eine durch natürlichsprachige Modelleingaben nutzbare Schnittstelle zur Interaktion mit einem #acrpl("LGM")-Modellen bietet.
#acr("PRODIGY") führt eine einheitliche „Prompt-Graph“-Darstellung ein, mit der sich Knoten-, Kanten- und Graph-Aufgaben gleichermaßen als Kontext-plus-Abfrage ausdrücken lassen
  #cite(<huang2023prodigyenablingincontextlearning>, supplement: "S. 1-2"). 
Ein #acr("LGM"), welches i.d.R. mehrschichtige #acrpl("GAN") nutzt, kann dynamisch aus diesem Teilgraphen extrahieren, welche als Few-Shot-Prompts genutzt werden können und dem Prompt beigefügt werden
  #cite(<huang2023prodigyenablingincontextlearning>, supplement: "S. 2"). 
Durch Hinzugabe von konkreten, sachbezogenen Beispielen für jede Aufgabe wird ein breiter, aufgabenübergreifender Einsatz möglich
  #cite(<huang2023prodigyenablingincontextlearning>, supplement: "S. 8-10").

Weitere Ansätze zur Erweiterung der Wissensbasis umfassen Integrationen von #acr("RAG")-Systemen in #acrpl("LGM"), worunter man eine Anbindung einer Vektordatenbank an ein #acr("AI")-Modell versteht
  #cite(<mao-etal-2021-generation>, supplement: "S. 1").
#cite(<hu2025graggraphretrievalaugmentedgeneration>, form: "prose") aus dem Jahr #cite(<hu2025graggraphretrievalaugmentedgeneration>, form: "year") stellen einen Ansatz vor, der die Leistung von #acrpl("LGM")-Modellen durch die Integration von #acr("RAG")-Systemen verbessert.
#acr("GRAG") integriert eine Vektordatenbank, die Textchunks als Wissensgraph speichert, die jeweils zum Prompt passenden Chunks aus der Datenbank lädt und diese als Kontext für das #acrpl("LGM")-Modell bereitstellt. Eine vereinfachte Darstellung ist in @GRAG dargestellt. Dies erlaubt es, ein #acr("LGM")-Modell mit einer breiten Wissensbasis zu betreiben, ohne dass dieses explizit auf diese Daten trainiert #box([werden muss
  #cite(<mao-etal-2021-generation>, supplement: "S. 2-3").
#cite(<hu2025graggraphretrievalaugmentedgeneration>, supplement: "S. 1-4").])

#figure(caption: "Funktionsweise von GRAG " + cite(<hu2025graggraphretrievalaugmentedgeneration>, form: "normal"), image("pictures/GRAG.png"))<GRAG>

=== Zusammenfassung der Ergebnisse <Ergebnisse>
Nach Betrachtung beider Ansätze zur Verbesserung der Leistungsfähigkeit und zur Erhöhung der Anwendungsvielfalt zeigt sich, dass eine Kombination vergleichbar mit der Entwicklung im Bereich der #acrpl("LLM")-Architekturen sinnvoll ist. Während die Leistungsfähigkeit durch eine Verbesserung der Trainingsdaten und der Reduktion manueller Eingriffe in den Trainingsprozess gesteigert wird, wird die Anwendungsvielfalt durch eine Vereinheitlichung der Eingabeformate und eine breite Wissensbasis erhöht. Diese Ansätze ermöglichen es, #acrpl("LGM") in einer Vielzahl von Anwendungsfällen einzusetzen und deren Leistung zu verbessern.

Eine #acr("LGM")-Architektur, die beide Ansätze kombiniert, wurde von #cite(<de2024griffinmixinggatedlinear>, form: "prose") im Jahr #cite(<de2024griffinmixinggatedlinear>, form: "year") vorgestellt.
Griffin ist ein hybrides #acr("LGM"), das #acr("RG-LRU") mit lokaler Multi-Query Attention aus #acrpl("GAN") kombiniert, um sowohl die spezifische Leistungsfähigkeit auf Modell-Ebene als auch die allgemeine Anwendbarkeit zu gewährleisten. Dabei werden mehrere Expertenmodelle trainiert, die jeweils auf einen spezifischen Anwendungsfall spezialisiert sind. Ein Gating-Netzwerk entscheidet dann, welcher Experte für eine gegebene Eingabe am besten geeignet ist. Der Kern liegt darin, die Stärken rekurrenter und aufmerksamkeitsbasierter Mechanismen zu vereinen, ohne die hohen Rechenkosten globaler Attention-Strukturen in Kauf nehmen zu müssen, wodurch Griffin in der Lage ist, diverse Use-Cases bei niedrigem #box([Tokeneinsatz abzudecken
  #cite(<de2024griffinmixinggatedlinear>, supplement: "S. 1-3").])

Inwiefern ein Fokus auf eine der beiden Kategorien sinnvoll ist, hängt stark vom Anwendungsfall ab, weswegen sich anhand der Literatur kein eindeutiger Trend ableiten lässt. Anhand der Anzahl der in diesem Review betrachteten wissenschaftlichen Arbeiten zeigt sich, dass die Forschung der Verbesserung der Leistung einen höheren Stellenwert zuschreibt, während die Publikationen, welche von Unternehmen veröffentlicht wurden, einen stärkeren Fokus auf die Erhöhung der Anwendungsvielfalt und Einsparung von Kosten legen
  #cite(<ma2025largelanguagemodelsmeet>, supplement: "S. 5-7")
  #cite(<de2024griffinmixinggatedlinear>, supplement: "S. 1-2").
Aufgrund dieser Differenz kann keine eindeutige Tendenz abgeleitet werden und bei einer Optimierung eines #acrpl("LGM")-Modells sollte sich anhand gegebener Umstände für einen der beiden Ansätze entschieden werden.

= Schlussbetrachtung

Im Folgenden werden die Ergebnisse zusammengefasst, deren Limitationen und Herausforderungen diskutiert und ein Ausblick auf zukünftige #box([Entwicklungen gegeben.])

== Fazit
In dieser Arbeit wurde im Rahmen einer Literaturrecherche wie in @Methodik erläutert ein Überblick über den aktuellen Stand der Forschung zu #acrpl("LGM") gegeben. Nach einem Einblick in die Entwicklung von Methoden wie #acr("kNN") bis hin zu #acrpl("LGM") wurden verschiedene Architekturen vorgestellt und deren #box([Funktionsweise erklärt. ])

Dabei zeigte sich, dass es zwei Hauptansätze zur Optimierung von #acrpl("LGM") gibt: die Verbesserung der Leistungsfähigkeit und die Erhöhung der Anwendungsvielfalt. Beide Ansätze haben ihre Vor- und Nachteile, und die Wahl des geeigneten Ansatzes hängt stark vom jeweiligen Anwendungsfall ab. Umsetzungen wie Griffin von #cite(<de2024griffinmixinggatedlinear>, form: "prose") zeigen, dass eine Kombination beider Ansätze möglich ist und sich gegenüber älterer #acrpl("GNN")-Architekturen in Benchmarks wie "RelBench" durchsetzen kann.


Zukünftige Entwicklungen in diesem Bereich könnten darauf abzielen, die Stärken beider Ansätze zu kombinieren, um #acrpl("LGM")-Modelle zu schaffen, die sowohl leistungsfähig als auch vielseitig einsetzbar sind.

#pagebreak()

== Limitationen und Herausforderungen
Die Aussagekraft der Ergebnisse dieser Arbeit unterliegt folgenden Limitationen, welche die Generalisierbarkeit der Ergebnisse einschränken:

- *Begrenzte Anzahl an wissenschaftlichen Arbeiten*: Die Literaturrecherche ergab nur eine begrenzte Anzahl an relevanten wissenschaftlichen Arbeiten, was die Generalisierbarkeit der Ergebnisse einschränkt.
- *Schneller Wandel der Forschung*: Der Bereich der #acrpl("LGM") befindet sich in einem schnellen Wandel, wodurch die Ergebnisse dieser Arbeit möglicherweise nur eine Momentaufnahme darstellen und zukünftige Entwicklungen nicht berücksichtigen.
- *Subjektive Auswahl der Arbeiten*: Die Auswahl der wissenschaftlichen Arbeiten erfolgte subjektiv, was zu einer Verzerrung der Ergebnisse führen könnte.
- *Fokus auf bestimmte Datenbanken*: Die Literaturrecherche konzentrierte sich auf bestimmte wissenschaftliche Datenbanken, wodurch relevante Arbeiten, die in anderen Datenbanken veröffentlicht wurden, möglicherweise übersehen wurden.

Ebenfalls ergaben sich Herausforderungen hinsichtlich Zugriffsrechte und Verfügbarkeit von Quellen, welche bei einer wiederholten Recherche berücksichtigt werden sollten und ggf. zu abweichenden Ergebnissen führen könnten. Darüber hinaus wurden die Erkenntnisse der wissenschaftlichen Arbeiten nicht auf ihre praktische Umsetzbarkeit geprüft, wodurch Herausforderungen bei der Implementierung in realen Anwendungsfällen auftreten könnten.

#pagebreak()

== Ausblick
Zusammenfassend lässt sich sagen, dass #acrpl("LGM") ein vielversprechender Ansatz zur Verarbeitung von strukturierten Daten ist, der in Zukunft weiter erforscht und optimiert werden sollte. Die Vorteile, die eine Speicherung von strukturierten Daten in Form von Graphen bietet, sind vielversprechend und könnten in vielen Anwendungsfällen im Geschäftsumfeld zu einer verbesserten Leistung führen.

Inwiefern die in dieser Arbeit vorgestellten Ansätze zur Optimierung von #acrpl("LGM")-Modellen in der Praxis umsetzbar sind, sollte in zukünftigen Arbeiten untersucht werden. Dabei könnten auch Herausforderungen bei der Implementierung in realen Anwendungsfällen adressiert werden, ebenso der Vergleich der Leistung von #acr("LGM")-Modellen mit anderen #acr("AI")-Modellarten, wie tabellenbasierten Modelen oder #acrpl("LLM"), hinsichtlich eines spezifischen Use-Cases, um deren Stärken und Schwächen besser zu verstehen.
]