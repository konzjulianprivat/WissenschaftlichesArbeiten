#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl

#let appendix = [

  #set par(leading: 0.5em)

#figure(caption: "Ergebnisse der Literaturrecherche", table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  align: horizon,
  table.header(
    [*Titel*], [*Autoren*], [*Jahr*], [*Quelle*]
  ),
  // Beispielzeilen
  [#align(left, [Graph Attention Networks])],[Velickovic et al.], [2018], [ResearchGate],
  [#align(left, [Graph Meets LLMs: Towards Large Graph Models])],[Zhang et al.], [2023], [arXiv],
  [#align(left, [Let's Ask GNNs: Empowering Large Language Models with Graph In-Context Learning])],[Hu et al.], [2025], [ACL Antology],
  [#align(left, [PRODIGY: Enabling In-context Learning Over Graphs])],[Huang et al.], [2023], [ACM Digital Library],
  [#align(left, [RelBench: A Benchmark for Deep Learning on Relational Databases])],[Robinson et al.], [2024], [arXiv],
  [#align(left, [Griffin: Mixing Gated Linear Recurrences with Local Attention for Efficient Language Models])],[De et al.], [2024], [arXiv],
  [#align(left, [SimGRACE: A  Simple Framework for Graph Contrastive Learning without Data Augmentation])],[Xia et al.], [2022], [arXiv],
  [#align(left, [GRAG: Graph Retrieval-Augmented Generation])],[Hu et al.], [2023], [ACL Antology],
  [#align(left, [Graph Contrastive Learning with Augmentations])],[You et al.], [2021], [arXiv],
))<LiteratureReviewResults>

#set par(leading: 1.5em)
  // #v(12em)
  // #rotate(90deg, [#figure(caption: "SAP AI Services - Aufgaben der RIG " + cite(<sap2025rig>, supplement: "S. 8"),image("pictures/RIG_Tasks.png", width: 150%))<RIGPhases>])

  // #set par(leading: 1em)
  // #figure(caption: "Verwendete Python Libraries", table(
  //   columns: (auto, 22em),
  //   inset: 8pt,
  //   align: horizon,
  //   table.header(
  //     [*Library*], [*Beschreibung*],
  //   ),
  //   [#align(left, [json])], [#align(left, [Verarbeitung von JSON-Daten])],
  //   [#align(left, [csv])], [#align(left, [Lesen und Schreiben von CSV-Dateien])],
  //   [#align(left, [numpy])], [#align(left, [Numerische Berechnungen und Arrays])],
  //   [#align(left, [pandas])], [#align(left, [Datenanalyse und -manipulation])],
  //   [#align(left, [matplotlib])], [#align(left, [Erstellung von Diagrammen und Plots])],
  //   [#align(left, [gen_ai_hub])], [#align(left, [Einbindung des SAP GenAI Hub])],
  //   [#align(left, [requests])], [#align(left, [HTTP-Anfragen senden und empfangen])],
  //   [#align(left, [oauthlib])], [#align(left, [Implementierung von OAuth-Authentifizierung])],
  // ))<PythonLibrariesUsed>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Zu extrahierende Datenfelder je Kunde", table(
  //   columns: (6em, 8em, auto, auto),
  //   inset: 8pt,
  //   align: horizon,
  //   table.header(
  //     [*Feld*], [*Enum*], [*Beschreibung*], [*Merkmal(e)*]
  //   ),
  //   [#align(left, [Customer Name])], 
  //     [-],
  //     [#align(left, [Der Name des Kunden])],
  //     [#align(left, [Teil des Betreffs])],
  //   [#align(left, [Customer ID])], 
  //     [-],
  //     [#align(left, [Die #acr("ID") eines Kunden])],
  //     [#align(left, [10-stellige Nummer])],
  //   [#align(left, [Product Name])], 
  //     [siehe @SAPBusinessAIProducts],
  //     [#align(left, [Der Name des SAP Business AI Produktes])],
  //     [-],
  //   [#align(left, [Opportunity #acr("ID")])], 
  //     [-],
  //     [#align(left, [Die #acr("ID") des Kundenvertrags])],
  //     [10-stellige Nummer, beginnend mit '030'],
  //   [#align(left, [Status])], 
  //     [siehe @ActivationStatus],
  //     [#align(left, [Der Status der Produktaktivierung])],
  //     [-],
  //   [#align(left, [Analysis])], 
  //     [-],
  //     [#align(left, [Zusammenfassung des Status])],
  //     [-],
  //   [#align(left, [#acr("RIG") Kontakt])], 
  //     [Mitarbeiter der #acr("AI") #acr("RIG")],
  //     [#align(left, [Zuständiger #acr("RIG")-Berater])],
  //     [Beantwortet eingehende E-Mails],
  //   [#align(left, [On-Hold Datum])], 
  //     [-],
  //     [#align(left, [Datum der Weiterführung der Aktivierung])],
  //     [Nur gesetzt, wenn Status = 'On Hold'],
  // ))<ExtractionSchema>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Anzunehmende Statuswerte einer Aktivierung", table(
  //   columns: (10em, auto),
  //   inset: 8pt,
  //   align: horizon,
  //   table.header(
  //     [*Status*], [*Beschreibung*],
  //   ),
  //   [#align(left, [Preparing Outreach])], 
  //     [#align(left, [New opportunity, no reach-out email has been sent yet to account teams (opportunity owners).])], 
  //   [#align(left, [In Analysis])], 
  //     [#align(left, [After the first reach-out email, before we receive the first response/context of the opportunity deal.])], 
  //   [#align(left, [Waiting For Answer])], 
  //     [#align(left, [Awaiting feedback for outreach emails after a reminder was sent.])], 
  //   [#align(left, [On Hold])], 
  //     [#align(left, [Currently not planning to do any AI use case preparation/activation work, due to other priorities/restrictions.])], 
  //   [#align(left, [In Preparation])], 
  //     [#align(left, [After we receive the first feedback from the right contact person; in the process of clarifying/finalizing the use cases.])], 
  //   [#align(left, [Awareness session / JSD suggested])], 
  //     [#align(left, [For RISE/potential RISE customers, if they need support on use case discovery, we connect account teams to the JSD (Jump Start Discovery) team. RIG contact to keep the “Workshop Status” field up to date (not planned, scheduled, in progress, or delivered) in MXP.])], 
  //   [#align(left, [In Activation])], 
  //     [#align(left, [After use cases are identified, start the technical activation (but before the first activation is completed).])], 
  //   [#align(left, [Activated])], 
  //     [#align(left, [First AI (GenAI, Joule, BTP) use case activated in any system.])], 
  //   [#align(left, [Customer not interested in product])], 
  //     [#align(left, [The customer has rejected implementing AI use cases, with no plan to activate any use case. We still suggest exploring possible use cases.])], 
  //   [#align(left, [Discontinued])], 
  //     [#align(left, [The deal was closed without an AI unit or does not apply to this particular account])], 
  // ))<ActivationStatus>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Material ID's der SAP Business AI Produkte", table(
  //   columns: (auto, auto),
  //   inset: 8pt,
  //   align: horizon,
  //   table.header(
  //     [*Produktname*], [*zugehörige Material-#acrpl("ID")*],
  //   ),
  //   [#align(left, [SAP Ariba Category Management])], [#align(left, [8015105])],
  //   [#align(left, [SAP Adv VC and Pricing, Commerce, access])],[#align(left, [8015476])], 
  //   [#align(left, [SAP Adv VC & Pricing, add-on for SAP CPQ])],[#align(left, [8015503])], 
  //   [#align(left, [SAP Enterprise Service Management])], [#align(left, [8015863])], 
  //   [#align(left, [RISE wSAP S/4HANA Cld, priv ed, prem pl])], [#align(left, [8016421, 8018501])], 
  //   [#align(left, [SAP AI Unit])], [#align(left, [8016532, 8016551, 8018592])], 
  //   [#align(left, [SAP Joule embedded entitlement])], [#align(left, [8017178])], 
  //   [#align(left, [SAP AI Core extended])], [#align(left, [8017491])], 
  //   [#align(left, [SAP CX AI Toolkit])], [#align(left, [8017592])], 
  //   [#align(left, [SAP IPR])], [#align(left, [8017891])], 
  //   [#align(left, [RISE with SAP S/4HANA Cld, priv ed, prem])], [#align(left, [8018418])], 
  //   [#align(left, [RISE w SAP S4HANA Cld, priv ed, base])], [#align(left, [8018511])], 
  //   [#align(left, [Joule limited promotion])], [#align(left, [8018808])], 
      
  // ))<SAPBusinessAIProducts>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Struktur des verwendeten Chain-of-Thought Prompts", supplement: "Prompt", kind: "prompt", table(
  //     columns: (auto, auto),
  //     inset: 8pt,
  //     align: horizon,
  //     table.header(
  //       [*Rolle*],[*Inhalt*],
  //     ),
  //     [*System*],[#align(left, [``` You are a helpful email data extraction assistant with strong chain-of-thought reasoning abilities.
  //     Your task is to first perform detailed, step-by-step reasoning to analyze and extract key elements from an email.
  //     Do not include your reasoning steps in the final output.```])],
  //     [*User*],[#align(left, [``` 
  //     EXTRACT DATA FROM THE FOLLOWING EMAIL USING DETAILED CHAIN-OF-THOUGHT REASONING:
  //       Subject: {{?subject}}
  //       Body: {{?main_body}}
  //       E-Mail-Context: {{?context_body}}
  //     Break down the email content step-by-step and then provide only a valid JSON object as a result ```])],
      
  //   ))<ChainOfThoughtPrompt>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Struktur des verwendeten Self-consistency Prompts", supplement: "Prompt", kind: "prompt", table(
  //     columns: (auto, auto),
  //     inset: 8pt,
  //     align: horizon,
  //     table.header(
  //       [*Rolle*],[*Inhalt*],
  //     ),
  //     [*System*],[#align(left, [``` You are a highly reliable email data extraction assistant, specialized in self-consistency reasoning.
  //     For this task, generate multiple independent chains-of-thought to extract the email details.
  //     Then, evaluate these reasoning paths internally and converge on the most consistent final answer.```])],
  //     [*User*],[#align(left, [``` 
  //     EXTRACT DATA FROM THE FOLLOWING EMAIL USING SELF-CONSISTENCY TECHNIQUES:
  //       Subject: {{?subject}}
  //       Body: {{?main_body}}
  //       E-Mail-Context: {{?context_body}}
  //     Generate several chains-of-thought reasoning paths to process the content, evaluate them and provide only a valid JSON object as a result
  //       ```])],
      
  //   ))<SelfConsistencyPrompt>
  // #set par(leading: 1.5em)

  // #set par(leading: 1em)
  // #figure(caption: "Anhang je Beispiel bei Verwendung von One-/Few-Shot-Prompting", supplement: "Prompt", kind: "prompt", table(
  //     columns: (auto, auto),
  //     inset: 8pt,
  //     align: horizon,
  //     table.header(
  //       [*Rolle*],[*Inhalt*],
  //     ),
  //     [*User*],[#align(left, [``` 
  //   ...
  //   Exmaple:
  //     Subject: {{?example_subject}}
  //     Body: {{?example_main_body}}
  //     E-Mail-Context: {{?example_context_body}}
  //     Solution: {{?example_solution}}
  //   ...
  //     ```])],
      
  //   ))<PromptExampleStructure>
  // #set par(leading: 1.5em)

  // #figure(caption: "Identifikationsraten [beste o1 Konfig.]. Eigene Darstellung.", image("pictures/EV_groups_o1_final.png", width: 100%))<EV_groups_o1_final>

  // #figure(caption: "Identifikationsraten [beste o3-mini Konfig.]. Eigene Darstellung.", image("pictures/EV_groups_o3-mini_final.png", width: 100%))<EV_groups_o3-mini_final>
]