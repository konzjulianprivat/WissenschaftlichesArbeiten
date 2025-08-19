#import "acronyms.typ": acronyms 
#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl
#import "variables.typ": variables
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl
#import "main.typ": main
#import "appendix.typ": appendix

// #let std-bibliography = bibliography
// #let bibliography = bibliography("sources.bib")

// Set global cite style
#set cite(style: "ieee")

// Set global font type and size
#set text(font: "Arial", size: 12pt)

// Set line spacing to 1.5
#set par(leading: 1.5em, spacing: 2.5em)

// Define global text sizes
#let title-size = 1.5em
#let subtitle-size = 1.25em
#let body-size = 1em
#let section-spacing = 2em
#let spacing = 1em
#let small-spacing = 0.5em

// Define logo heights
#let left-logo-height = 1.5cm
#let right-logo-height = 1.5cm

// Define logo paths
#let logo-left = "pictures/DHBW_MA_Logo.jpg"
#let logo-right = "pictures/SAP_R_grad_scrn.jpg"
#let title = "Analyse der Einsatzmöglichkeiten von State-of-the-Art Large Graph Models gegenüber Large Language Models zur Verarbeitung von strukturierten Daten"
#let nameAuthor = "Julian Konz"

// Define header and footer content
#let header-content = none

#let generate-footer-content(numbering) = context {
  let heading_selector = heading.where(level: 1)
    .or(heading.where(level: 2))
    .or(heading.where(level: 3))
  
  // Query all headings matching the selector
  let all_headings = query(heading_selector)
  let current_page = here().page()
  
  let relevant_headings = ()
  for i in range(all_headings.len()) {
    let h = all_headings.at(i)
    let heading_page = h.location().page()
    let next_heading_page = if i + 1 < all_headings.len() {
      all_headings.at(i + 1).location().page()
    } else {
      current_page + 1
    }
    
    if heading_page == current_page or (heading_page < current_page and next_heading_page > current_page) {
      relevant_headings.push(h)
    }
  }
  line(length: 100%)
  v(-2em)
  stack(
    dir: ltr,
    spacing: 1em,
    align(left, {
      if relevant_headings.len() > 0 {
        relevant_headings.map(h => h.body).join(" • ")
      } else {
        ""
      }
    }),
    align(right, text(size: 12pt, weight: "regular", counter(page).display(numbering)))
  )
}

//-----------------------------------------------------------------------------------
// Title Page
//-----------------------------------------------------------------------------------

// Place the logos
#stack(dir: ltr, spacing: 1fr,
  align(horizon, image(logo-right, height: right-logo-height)),
  align(horizon, image(logo-left, height: left-logo-height)),
)

// Title
// #v(spacing*3)
#set par(leading: 0.5em)
#v(-0.5em)
#align(center, text(weight: "semibold", size: title-size, title))
#set par(leading: 1.2em)

#v(-0.5em)

// Confidentiality marker (SPERRVERMERK)
#align(center, text(weight: "semibold", size: title-size, "Research Paper"))

#v(-0.5em)

// Type of Thesis
#align(center, text(weight: "semibold", size: subtitle-size, "W3WI_702: Schlüsselqualifikationen II"))

// Course of Studies
#align(center, text(size: body-size, "aus dem Studiengang Wirtschaftsinformatik Sales & Consulting an der Dualen Hochschule Baden-Württemberg Mannheim"))

#v(-1em)
#align(center, text(size: body-size, "von"))
#v(-1em)
#align(center, text(weight: "medium", size: subtitle-size , nameAuthor))


#v(small-spacing)

// Author Information
#grid(
  columns: (auto, auto),
  row-gutter: 12pt,
  column-gutter: 2.5em,

  // Date
  text(weight: "semibold", size: body-size, "Bearbeitungszeitraum:"),
  text(size: body-size, "12.05.2025 - 24.08.2025"),

  // Student ID and Course
  text(weight: "semibold", size: body-size, "Matrikelnummer, Kurs:"),
  text(size: body-size, "3468097, WWI23SCB"),

  // University Course Leader
  text(weight: "semibold", size: body-size, "Studiengangsleiter:"),
  text(size: body-size, "Prof. Dr. Clemens Martin"),

  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),

  // Company
  text(weight: "semibold", size: body-size, "Ausbildungsfirma:"),
    stack(
    spacing: small-spacing,
    text(size: body-size, "SAP SE"),
    text(size: body-size, "Dietmar-Hopp-Allee 16"),
    text(size: body-size, "69190 Walldorf, Deutschland")
  ),

  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),

  // Company Supervisor
  // text(weight: "semibold", size: body-size, "Betreuer der Ausbildungsfirma:"),
  // stack(
  //   spacing: small-spacing,
  //   text(size: body-size, "Felix Bartler"),
  //   text(size: body-size, "felix.bartler@sap.com"),
  //   text(size: body-size, "+496227750225")
  // ),

  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),

  // University Supervisor
  text(weight: "semibold", size: body-size, "Wissenschaftlicher Betreuer:"),
  stack(
    spacing: small-spacing,
    text(size: body-size, "Dr. Jörg Astheimer"),
    text(size: body-size, "joerg.astheimer@dhbw.de"),
  )
)

// Page break
#pagebreak()
//-----------------------------------------------------------------------------------
// Eidesstattliche Erklärung
//-----------------------------------------------------------------------------------
#set page(
  paper: "a4",
   margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: none,
  footer: generate-footer-content("I"),
  numbering: "I",
)
#counter(page).update(1)

#init-acronyms(acronyms)
#init-variables(variables)
#set heading(numbering: "I.",outlined: false)
#show heading.where(level: 1): it => {
  set text(size: 18pt, weight: "bold")
  v(1.5em)
  it
  v(1em)
}
#show heading.where(level: 2): it => {
  set text(size: 16pt, weight: "bold")
  v(1em)
  it
  v(0.5em)
}
#show heading.where(level: 3): it => {
  set text(size: 14pt, weight: "bold")
  v(1em)
  it
  v(0.5em)
}
#set par(justify: true, leading: 1.5em)
#set text(hyphenate: true, lang: "de")

= Eidesstattliche Erklärung
#align(left, text("Ich versichere hiermit, dass ich meine Projektarbeit mit dem Thema 'Analyse der Einsatzmöglichkeiten von State-of-the-Art Large Graph Models gegenüber Large Language Models zur Verarbeitung von strukturierten Daten selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt."))

// Space for the signature
#v(7em)

// Table for "Ort, Datum" and "Unterschrift"
#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 12em, 
  // Left Column
  text(weight: "semibold", "____________________________"),
  // Right Column
  text(weight: "semibold", "________________________"),
  // Left Column
  text(weight: "semibold", "Ort, Datum"),
  // Right Column
  text(weight: "semibold", "Unterschrift")
)


//-----------------------------------------------------------------------------------
// Sperrvermerk
//-----------------------------------------------------------------------------------
// #pagebreak()
// = Sperrvermerk
// // Sperrvermerk Content
// Die nachfolgende Arbeit enthält vertrauliche Daten und Informationen der SAP SE, Dietmar-Hopp-Allee 16, 69190 Walldorf, Deutschland. Der Inhalt dieser Arbeit darf weder als Ganzes noch in Auszügen Personen außerhalb des Prüfungsprozesses und des Evaluationsverfahrens zugänglich gemacht werden. Veröffentlichungen oder Vervielfältigungen der Projektarbeit #box("- auch auszugsweise -") sind ohne ausdrückliche Genehmigung der SAP SE in einem unbegrenzten Zeitrahmen nicht gestattet. Über den Inhalt dieser Arbeit ist Stillschweigen #box("zu wahren.")

// SAP und die SAP Logos sind eingetragene Warenzeichen der SAP SE. Die Wiedergabe von Gebrauchsnamen, Handelsnamen, Warenbezeichnungen usw. in dieser Arbeit berechtigt auch ohne besondere Kennzeichnung nicht zu der Annahme, dass solche Namen im Sinne der Warenzeichen- und Markenschutz-Gesetzgebung als frei zu betrachten wären und daher von jedem benutzt #box("werden dürfen.")

//-----------------------------------------------------------------------------------
// Gleichbehandlung
//-----------------------------------------------------------------------------------
#pagebreak()
= Gleichbehandlung der Geschlechter
In dieser Praxisarbeit wird aus Gründen der besseren Lesbarkeit das generische Maskulinum verwendet. Weibliche und anderweitige Geschlechteridentitäten werden dabei ausdrücklich mitgemeint, soweit es für die Aussage erforderlich ist.

//-----------------------------------------------------------------------------------
// Disclaimer
//-----------------------------------------------------------------------------------
#pagebreak()
= Disclaimer
// Disclaimer Content
Ein Teil der Literatur, die für die Anfertigung dieser Arbeit genutzt wird, sind nicht als Buchfassung verfügbar. Bei diesen Ressourcen existieren keine Seitennummern, es wird bei Verweisen stattdessen die Kapitelnummer oder auf die zugehörige Webseite im Literaturverzeichnis angegeben.

Um den Lesefluss zu verbessern, werden Abbildungen und Tabellen, die den Lesefluss stören, im Anhang platziert, auf den im Text zusätzlich #box([verwiesen wird.])

//-----------------------------------------------------------------------------------
// Abstract
//-----------------------------------------------------------------------------------
#pagebreak()
= Abstract

#grid(
  columns: (auto, auto),
  row-gutter: 18pt,
  column-gutter: 2.5em,
  text("Titel:"),
  text([Analyse der Einsatzmöglichkeiten von State-of-the-Art Large Graph Models gegenüber Large Language Models zur Verarbeitung von strukturierten Daten]),
  
  text("Verfasser:"),
  text(nameAuthor),
  
  text("Kurs:"),
  text("WWI 23 SCB"),
  text("Ausbildungsbetrieb:"),
  text("SAP SE"),
)
#v(1em)
// Fasse hier die Arbeit und die Ergebnisse kurz und prägnant zusammen.

Im Rahmen dieser Arbeit wird ein Proof of Concept zur automatisierten Extraktion strukturierter Reportingdaten aus E-Mails der SAP AI Regional Implementation Group durch Large Language Models entwickelt und optimiert.  
Dies erfolgte entlang des Cross Industry Standard Process for Data Mining und evaluierte den Einfluss der Modellauswahl und Promptingstrategie auf die Datenqualität.

In einem experimentellen Aufbau werden drei Modelle (GPT-4o, o3-mini, o1) mit neun Prompting-Strategien (Baseline, Chain-of-Thought und Self-consistency, jeweils als Zero-/One- und Few-Shot-Prompt) verglichen. Die Analyse zeigte einen signifikanten Einfluss der Modellwahl auf die Extraktionsgenauigkeit. Das Modell o1 erzielte dabei die höchsten Ergebnisse gegenüber den anderen Modellen. Die beste Konfiguration erreichte ein Self-Consistency-One-Shot-Prompt des Modells OpenAI o1 mit einer Datenextraktionsgenauigkeit von 74% und einer Identifikationsgenauigkeit des zugehörigen Reporting-Eintrags von 95%.

Die entwickelte Modellierung erfüllt die von der SAP AI Regional Implementation Group definierten Qualitätskriterien für die automatisierte Datenextraktion. Auf Basis dieser Ergebnisse wird nach Validierung auf einem erweiterten Datensatz eine schrittweise Produktivnahme empfohlen.

// Die Modellierung erreicht von der Abteilung definierte Qualitätskriterien für die automatisierte Datenextraktion, weswegen eine schrittweise Produktivnahme nach erfolgreicher Skalierung auf einen umfangreicheren und zeitlich aktuelleren Datensatz aussteht.

// Aufgrund einer zu hohen Identifikationsrate falsch-positiver Reporting-Einträge erfolgt keine Produktivnahme des PoC, zeigt jedoch das Potential LLM-basierter Ansätze in der Datenextraktion aus E-Mails für weitere Untersuchungen.

// Damit übertrifft das System die geforderte Feldgenauigkeit von 70%, wird jedoch aufgrund einer zu hohen falsch-positiven Identifikationsrate nicht implementiert.

//-----------------------------------------------------------------------------------
// Inhaltsverzeichnis, Abbildungsverzeichnis, Tabellenverzeichnis
//-----------------------------------------------------------------------------------
#pagebreak()

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

#show outline.entry.where(body: [Literaturverzeichnis] ): it => {
    v(12pt, weak: true)
    strong(it)
    numbering("i")
}

#set par(leading: 1em)

// Inhaltsverzeichnis (Table of Contents)
  #outline(
    title: "Inhaltsverzeichnis",
    depth: 3,
    indent: 1em,
    )
#pagebreak()

#set par(leading: 1.5em)
#set text(size: 10.5pt)
// #set text(weight: "light")

// Abbildungsverzeichnis (List of Figures)
  #outline(
    title: "Abbildungsverzeichnis",
    target: figure.where(kind: image)
  )
#pagebreak()
// Tabellenverzeichnis (List of Tables)
  #outline(
    title: "Tabellenverzeichnis",
    target: figure.where(kind: table)
  )
#pagebreak()
// Codeverzeichnis (List of Code) 
  #outline(
    title: "Promptverzeichnis",
    target: figure.where(kind: "prompt")
  )

#pagebreak()
// Abkürzungsverzeichnis (List of Abbreviations)
#print-acronyms(5em)

#pagebreak()
// Variablenverzeichnis (List of Variables)
#print-variables(5em)


//-----------------------------------------------------------------------------------
// Inhalt der Arbeit
//-----------------------------------------------------------------------------------
#set heading(numbering: "1.")
#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: header-content,
  numbering: "1",
  footer: generate-footer-content("1"),
)

#show heading.where(level: 1): it => {
    pagebreak()
    it
}
#show heading.where(level: 2): it => v(1em) + it + v(1em)
#show heading.where(level: 3): it => v(0.75em) + it + v(0.75em)

#counter(page).update(1)
#counter(heading).update(0)
#set heading(numbering: "1.",outlined: true)
#set math.equation(numbering: "(1)")

#set text(size: 12pt)

#main

#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: header-content,
  numbering: "i",
  footer: generate-footer-content("i"),
)
#set heading(numbering: none)
// #pagebreak()
#counter(page).update(1)
#counter(heading).update(0)
#set heading(numbering: "i.")
= Literaturverzeichnis
#bibliography("sources.bib",title: none)

#heading(level: 1, outlined: true)[Anhang]
    
#set heading(outlined: false, numbering: "1.")
#appendix