#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl

#let main = [

= Einleitung
Auf Basis des Fundaments von #cite(<shannon1948mathematical>, form: "prose") und der Forschung von #cite(<Vaswani2017SelfAttention>, form: "prose") zu neuronalen Netzen, welche kontextabhängige Informationen aus komplexen Eingaben nutzen können, um korrekte Modellausgaben zu generieren, ist ein neues Zeitalter von #acr("KI"), auf Englisch als #acr("AI") bekannt, eingetreten. #acr("AI")-Modelle wie Diese Entwicklungen führten zu erheblichen Fortschritten in der Integration von #acr("AI")-Technologien in vielfältige Anwendungsfelder, insbesondere in betriebswirtschaftliche Prozesse #cite(<srivastava2024medpromptextract>, supplement: "S. 8-9"). Durch #acr("AI")-gestützte Dienste wird es Unternehmen ermöglicht, Informationen aus Daten zu schließen, aus denen zuvor keine Erkenntnisse gewonnen werden konnten 
  #cite(<McKinsey2023EconomicAI>)
  #cite(<Zhao2023>, supplement: "S. 2-3").

Im Kontext von betriebswirtschaftlichen Prozessen liegen Daten in unterschiedlichen Formaten vor. Im Allgemeinen können diese Datenformate in strukturierte, beispielweise in tabellarischer Form vorliegende, und unstrukturierte, beispielweise in Freitexten vorkommende, Daten differenziert werden
  #cite(<McKinsey2023EconomicAI>). 
#acrpl("LLM") sind generative Sprachmodelle, die aus unstrukturierten Modelleingaben anhand von Wahrscheinlichkeiten eine natürlichsprachige Ausgabe produzieren
  #cite(<Zhao2023>, supplement: "S. 2"). 
Seit die Veröffentlichung von OpenAIs 'ChatGPT' im Jahr 2022 sind #acrs("LLM") in den Fokus der Öffentlichkeit gerückt und haben sich in den letzten Jahren zu einem der am häufigsten eingesetzten #acr("AI")-Modellarten entwickelt
  #cite(<McKinsey2023EconomicAI>).
Der Durchbruch für #acr("AI")-Modelle zur Verarbeitung von strukturierten Daten blieb zunächst aus.

#acrpl("LGM") werden aktuell als vielversprechender Ansatz diskutiert, um eine präzisere Verarbeitung von strukturierten Daten zu ermöglichen. Analog zu #acrpl("LLM") bezeichnet der Begriff #acr("LGM") Graphmodelle, die aufgrund großer Modellkapazität und Vortraining auf umfangreichen Graphdaten neuartige Fähigkeiten im Graphbereich zeigen sollen 
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1"). 
Graphen sind eine fundamentale Datenstruktur zur Repräsentation von Relationen zwischen Entitäten, beispielweise in Form von Wissensgraphen oder Datenbankrelationen, deren effiziente Auswertung für viele Domänen entscheidend ist. 
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1-2").
#acrpl("LGM") basieren auf den Fortschritten von #acrpl("GNN") als auch des Transfer-Lernens mit großen Modellen. #acrpl("GNN") stellen den bislang de-facto Standard zur Verarbeitung von Graphen dar, da sie durch Message Passing lokale Nachbarschaftsinformationen propagieren und so Graphstruktur als Induktive Bias einbeziehen.
  #cite(<zhang2023graphmeetsllmslarge>, supplement:"S. 1-4").

In dieser Arbeit soll untersucht werden, inwieweit #acrpl("LGM") im Vergleich zu #acrpl("LLM") bei der Verarbeitung von strukturierten Daten überlegen sind. Dabei wird ein besonderer Fokus auf die Anwendbarkeit von #acrpl("LGM") in betriebswirtschaftlichen Prozessen gelegt. Im Rahmen einer Literaturrecherche werden insgesamt vier Datenbanken auf jeweils zehn relevante wissenschaftliche Arbeiten untersucht, die sich mit der Verarbeitung von strukturierten Daten durch #acrpl("LGM") und #acrpl("LLM") befassen. Die Ergebnisse dieser Literaturrecherche werden in einem Review zusammengefasst und auf ihre Relevanz und Ergebnisse evaluiert. Abschließend wird

Diese Arbeit zielt darauf ab, einen Einblick in die Chancen und Herausforderungen von #acrpl("LGM") im Vergleich zu #acrpl("LLM") zu geben und deren Potenzial für die Verarbeitung von strukturierten Daten in betriebswirtschaftlichen Anwendungen zu bewerten.


= Methodische Vorgehensweise des Reviews
Dieses Review folgt einem vorab fixierten Protokoll entlang etablierter Leitlinien für systematische Literaturübersichten in Wirtschaftsinformatik/SE (Planung–Durchführung–Bericht) 
  #cite(<Kitchenham2007SLR>, supplement: "S. 5–7, 18–26").
Untersucht wird, inwieweit Large Graph Models (#acr("LGM")) gegenüber Large Language Models (#acr("LLM")) bei der Verarbeitung strukturierter Daten (v. a. Tabellen, Relationen, (Wissens-)Graphen) in betriebswirtschaftlichen Prozessen empirisch/konzeptionell im Vorteil sind (Leistung, Robustheit, Erklärbarkeit, Integrationsaufwand).

Um den State-of-the-Art zu erheben, wurde eine systematische Literaturrecherche durchgeführt. Als Quellen wurden wissenschaftliche Datenbanken und Repositorien wie arXiv, DBLP, IEEE Xplore, ACM Digital Library und Fachplattformen wie ResearchGate herangezogen, da diese in der Domäne der Wirtschaftsinformatik sowie #acr("KI") weit verbreitet und allgemein zugänglich sind. Die Suche konzentrierte sich auf Veröffentlichungen nach der Veröffentlichung von #cite(<Vaswani2017SelfAttention>, form: "prose"), da diese ein neues Kapitel in der Forschung von #acr("KI") eingeleitet hat. Peer-reviewte Veröffentlichungen (NeurIPS, ICML, KDD, ICLR u. a.) werden im Review höher gewichtet als nicht peer-reviewte Beiträge
  #cite(<Kitchenham2007SLR>, supplement: "S. 18–19").

Folgende Begriffe werden in den Datenbanken gesucht, um relevante wissenschaftliche Arbeiten zu identifizieren:

- “#acrf("LGM")”
- “#acrf("GNN")”
- “#acrf("LLM")”
- “Graph Transformer”
- “Knowledge Graph”
- “In-Context Learning Graph”
- “Relational Deep Learning”
- “Graph Representation Learning”
- “Tabular data deep learning”
- “Graph pre-training”
- “Graph foundation model”
- “Benchmark relational graph AI”

Durch Kombination dieser Begriffe konnten einschlägige Arbeiten identifiziert werden, beispielsweise führte die Suche nach “Graph meets LLM” zur Entdeckung eines Überblicksartikels von #cite(<zhang2023graphmeetsllmslarge>, form: "prose"), während “graph in-context learning” auf neuere Ansätze wie #cite(<hu2025letsaskgnnempowering>, form: "prose") verwies. Die Begriffe sind bewusst auf Englisch formuliert, da die Primärliteratur überwiegend englischsprachig ist. 

]