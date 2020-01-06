# Kotlin

**By: Jan Gerling, Aurél Bánsági, Kilian Callebaut, Dereck Bridie**

*Delft University of Technology*

<figure class="image">
	<img src="images/kotlin_banner.png" width="800" alt="{{ include.description }}">
    <figcaption>Kotlin Banner [26]</figcaption>
</figure>

# Table of Contents

-   [Introduction](#introduction)
-   [Stakeholders](#stakeholders)
-   [Context View](#context-view)
-   [Pull Request Analysis](#pull-request-analysis)
-   [Technical Debt](#technical-debt)
-   [Development View](#development-view)
-   [Contributors Perspective](#contributors-perspective)
-   [Conclusion](#conclusion)

 

Introduction
============

Kotlin is a relatively young language, developed by JetBrains, which quickly gained popularity. Announced in 2011 \[1\], it is a first-class language for Android \[2\]. Kotlin is used in approximately 5% of the apps available, but in roughly 25% of the “top apps”, such as Twitter or TikTok (\[3\]).

Kotlin operates primarily in the JVM, is fully interopable with Java, and currently supports Java versions 6 to 9. However, it does target many weaknesses of Java and improves on these. Examples of this are a clear distinction between nullable and non-nullable types and having stronger type inference. These changes lead to developers prefering Kotlin over Java.

Since 2017, Kotlin can also be compiled to JavaScript. This feature was to added to make the language more suitable for all tiers of development (\[4\]). Finally, Kotlin can also be compiled to native code on many different platforms. This is to allow it to run without a virtual machine, which allows Kotlin code to be self-contained. These changes were made to allow the use of Kotlin in as many places as possible, which makes it more appealing to companies.

Since Kotlin is open source, it is possible to contribute to it. Anyone is able to claim issues on YouTrack, the issue tracker developed by JetBrains. The merge process is transparent and visible for anyone. Reviews are done by JetBrains employees, who often requests changed before merging the contribution, if it was deemed suitable. Kotlin is licensed under the Apache 2 license, this means it is not required to sign a Contributor License Agreement to contribute. There is also a `contributing.md` file in the Kotlin repository, which explains the process and which offers a checklist that needs to be completed before submitting a pull rqeuest.

There are different components in the Kotlin project. Of course there is a compiler and parser, which handle the code itself. However, there are also multiple extensions for IntelliJ IDEA, which handles autocompletions or inspections. Most of the *easy* issues on YouTrack focus on the latter. Kotlin is also tested, having over 50,000 thoroughly developed tests. When contributing, one of the requirements is to create some tests for your contribution.

In this chapter, Kotlin will be researched in more detail by first giving an overview of the different stakeholders, before expanding this to a broader context view. This is to properly define the different actors and environment interacting with Kotlin. Then, a more detailed description of the development view is given. This section will contain aspects like standarization and instrumentation. Having looked at the development view, it is then possible to analyze the technical debt of Kotlin. This is important to know since it gives an idea of the current *health* of the Kotlin project. Finally, a new and unique view will be given. This will focus on how developers experience contributing to Kotlin. Over the course of the project, contributions were made to Kotlin. The experiences that occured while making these contributions will be used to enhance this section.

 

Stakeholders
============

Stakeholders are important to any software architecture, as these people can influence the direction a project moves towards. Therefore, their opinions should be taken into account when evaluating a project as a whole.

The following section gives an overview and analysis of the stakeholders of Kotlin. The stakeholders are categorized based on the stakeholder categories defined by Rozanski and Woods \[5\].

JetBrains s.r.o.
----------------

JetBrains is a software vendor, which develops tools for software developers and project managers. Their motivation to create Kotlin was that they needed a language on the JVM meeting the needs of their company \[6\]. JetBrains expects that the success of Kotlin will increase sales of IntelliJ IDEA, JetBrains’ IDE.

JetBrains role in Kotlin partly comes from manpower: 50+ engineers are working on the project \[7\], but more roles are fulfilled by JetBrains:

-   **Acquirer**
-   **Communicator**
-   **Developer**
-   **Maintainer**
-   **Support staff**
-   **Supplier**
-   **Tester**
-   **User**

Kotlin Foundation
-----------------

The non-profit Kotlin Foundation was created by JetBrains and Google in 2017. The Language Committee adheres to guidelines \[8\], which describe the decision making process, regarding incompatible changes to Kotlin.

The mission of the Kotlin Foundation is “to protect, promote and advance the development of the Kotlin programming language. The Foundation secures Kotlin’s development and distribution as Free Software \[…\]” \[9\]. Furthermore, the Foundation holds the Kotlin trademark and associated names and logos.

This stakeholder plays a large role as an **Assessor**, overseeing language evolution.

Lead Language Designer - Andrey Breslav
---------------------------------------

Andrey Breslav is the President of the Kotlin Foundation, and is a member of both the Board of Directors and the Language Committee. He is also employed by JetBrains as the Lead Language Designer in Kotlin \[9\]. Andrey is an important stakeholder within Kotlin, being an **Assessor**, **Developer**, **Maintainer**, and **Tester** with high authority.

Google Inc.
-----------

Google is the main distributor for Android applications, which can be written in Kotlin. Google has an interest in Kotlin, because the language could empower developers writing applications for their platform to work more efficiently. Google is an **Acquirer** of Kotlin.

Contributors
------------

Contributors are volunteers who are external to JetBrains who contribute to Kotlin as open source developers.

These Contributors can be found in the Kotlin Slack \[10\], a channel of communication between external developers and Kotlin core members.

These contributors are a part of the **Developer**, **Maintainer**, and **Tester** classes.

Users
-----

Developers writing code in Kotlin directly benefit from improvements to the language. Often, they represent themselves or their development team via public channels such as Twitter or Slack.

Furthermore, people using products written in Kotlin have to be considered, because they have important interests such as application performance, security, and stability.

Suppliers
---------

-   *Gradle:* Gradle is a build system that is capable of building Kotlin projects. Their interest in the Kotlin project is twofold: first, their build system should support Kotlin projects, and second, Gradle is also partially written in Kotlin \[11\].

Communication/Support
---------------------

Kotlin has various channels to communicate with their community \[12\].

-   *Discussion and announcements:* Kotlin Slack, Reddit, Twitter
-   *Support:* StackOverflow
-   *Gatherings:* User Groups, KotlinConf, Google I/O

Competitors
-----------

Kotlin has a multitude of competitors such as Groovy, Scala \[13\], and Java. All these programming languages are object oriented and focus on a similar group of developers, usually with prior Java experience and offer a comparable feature set.

Enhancers
---------

An important stakeholder type are Enhancers, library developers creating new functionalities for Kotlin language users. Therefore, these stakeholders add value to Kotlin by creating their own solutions within the scope of Kotlin.

Tools
-----

An additional class of stakeholders create tools for Kotlin developers, to increase their productivity and ease software development. Their interests are to generate income, add value to Kotlin and further spread Kotlin.

-   *detekt:* Static code analysis \[14\]
-   *dokka:* Documentation engine for Kotlin \[15\]
-   *IntelliJ IDEA*

Power/Interest grid
-------------------

A power/interest grid shows the power of a stakeholder to influence a project and their interest in the project \[16\].

<figure class="image">
<img src="diagrams/power-interest-grid.png" width="600"alt="{{ include.description }}">
<figcaption>
<b>Figure 201</b> - Power/Interest grid with the stakeholders of the Kotlin project.
</figcaption>
</figure>

Influence on Stakeholders
-------------------------

An onion diagram shows the interaction of stakeholders with a project and effect of the project on the stakeholders \[17,18\]. The diagram consists of five layers:

-   **Core** - the project goal
-   **Layer 1** - closely involved stakeholders
-   **Layer 2** - highly affected stakeholders
-   **Layer 3** - Beneficiaries
-   **Layer 4** - wider environment

<figure class="image">
<img src="diagrams/onion.png"  width="500" alt="{{ include.description }}">
<figcaption>
<b>Figure 202</b> Onion diagram of the key stakeholders of the Kotlin project and stakeholder types
</figcaption>
</figure>

Context View
============

The context view describes the relationships, dependencies and interactions between the system and its environment. This is visualized in the diagram. Each element of the diagram will be described in more detail in this section, along with an overview of the scope of the system.

<figure class="image">
<img src="diagrams/contextview-diagram.png"  width="1000" alt="{{ include.description }}">
<figcaption>
<b>Figure 203</b> Context View of Kotlin
</figcaption>
</figure>

System Scope
------------

Kotlin is a object-oriented programming language aiming to “provide a more concise, more productive, safer alternative to Java that’s suitable in all contexts where Java is used today” \[19\]. Kotlin tries to eliminate some of Java’s biggest issues like nullity and excessive coding \[20\]. In this regard, Kotlin’s scope is to provide an gradual upgrade from Java, by integrating Kotlin code into their existing Java Project. In order to enable developers to quickly adopt Kotlin, workflow and feature set are very similar.

Context Model
-------------

At the heart of the context model is the language itself. Kotlin is written in Java and Kotlin, and runs on the JVM by default. It can also be compiled to JavaScript \[21\] and to native code \[22\]. Kotlin natively makes use Java or JavaScript functions, when the correct compiler configuration is selected

### Developers

Kotlin is an open source project to which anyone can contribute on GitHub. These contributions are reviewed by JetBrains employees and merged into the project. Together with Google, JetBrains sponsors Kotlin. They are both represented in the Kotlin Foundation. The Language Committee is a part of the Kotlin Foundation and reviews breaking changes. Andrey Breslav is the lead Language Designer of the language. These people make all decisions regarding the development of the project and evolution of the language \[9\], as well as overviewing the community contributions.

### Related Processes

GitHub is used for contributing and project management of Kotlin. JetBrains uses their own software YouTrack for discussing and tracking issues, features, and bugs. TeamCity is used for continuous integration and deployment. Finally, other related processes are: JUnit for testing (with Kotlin extensions), Apache 2 License \[23\] and Gradle for building.

### Community

The Kotlin community has multiple channels to communicate their feedback for Kotlin. Conferences like Kotlin Conf serve to present updates from the Kotlin development team, as well as user’s talks about the state and usage of the language. The official Twitter \[24\] and the Kotlin subreddit \[25\] provide channels to post news updates, pose questions and discuss issues with the language where the JetBrains’ Kotlin team frequently responds. There are also more direct channels used to support developers like StackOverflow and Slack.

### Supported by

The Kotlin language is supported by many IDEs, such as JetBrains’ own IDE IntelliJ IDEA, Google’s Android Studio, and third party IDEs like NetBeans and Eclipse.

### Used by

A big advantage of using Kotlin is the support from Google for its Android platform. Another major use cases is in server side code. Examples of popular applications that have been developed using Kotlin are Uber \[26\], Netflix, Slack, and Twitter \[20\]. For Kotlin development there are enhancing frameworks available.

Pull Request Analysis
=====================

In this section we analyze the top ten most commented pull requests for Kotlin on GitHub \[27\], that were merged and rejected. We want to identify project integrators, main reasons why pull requests are rejected and which changes could lead to successful merge requests. Our strategy to identify these patterns, was to find the core of the discussion in PRs and discover reoccurring issues.

### Most commented merged PRs

Most PRs in this list seem to have a high comment number not due to controversy, but because of people misunderstanding or needing a more thorough explanation what the reviewer requested to change. This leads to a longer conversation in which the reviewer looks at the changes multiple times. A particularity of the Kotlin repository is that most of the pull requests are merged manually.

### Most commented unmerged PRs

Unmerged and closed PRs usually seem to be declined due to inactivity or because the changes are not what is deemed relevant for Kotlin at the times. At times, a senior developer for Kotlin at JetBrains, Mikhail Glukhikh, uses the PR system to perform extensive code reviews, which leads to a large amount of comments.

### Integrators

Kotlin uses a pull-based development model for doing reviews. Developers review the code and usually review the code within a few days. The reviews appear to be quite thorough, but most pull requests are merged either without changes required, or after one round of review. Most of these pull requests tag an open issue for Kotlin, which makes them easy to accept. However, as stated before, the changes are often manually merged. Most *failing* pull requests are not merged due to the changes not falling in line with the direction of where Kotlin is going.

Pull requests are integrated by senior developers at JetBrains, who review the code and request changes. One person, Mikhail Glukhikh \[28\], is assigned very often to review PRs.

Contact with JetBrains
----------------------

We tried to establish direct communication with the JetBrains Kotlin Team. Unfortunately, this did not succeed, thus, all communication, e.g. asking question was done on the Kotlin Slack \[10\].

 

Technical Debt
==============

In this section, technical debt in Kotlin is identified and analyzed, by dividing it into four areas: code debt, test debt, design debt, and communication about debt.

Code debt is important since it shows how maintainable the code is. Test debt is an important factor since lacking tests and bad test habits can have a large impact on the project and are hard to resolve in future. Design debt describes the debt caused by the module structure of the project, and dependencies on other code. Finally, communication about debt shows that the developers are aware of the debt.

Code Debt
---------

In order to properly analyze Kotlin, automatic analyzation tools are necessary. For this section we used detekt \[14\], a framework made specifically for Kotlin, and the Statistic plugin \[29\] for IntelliJ IDEA. Statistic allows to check several relatively simple metrics, e.g. logical lines of code (LLoC). Line based metrics have limited validity, but can provide basic insights.

Detekt is more powerful, but only analyses Kotlin files. It provides strong metrices, such as McCabe cyclometic complexity (MCC). Additionally, it also estimates the time to fix the code debt and points out specific problems.

### Results

It is evident that there is some serious code debt in Kotlin, negatively impacting maintenance due to a lack of clarity and explanations for the methods \[30\]. This creates a growing threshold for contributors in terms of time wasted on understanding the system.

Statistic showed that roughly 12% of the content of Java and Kotlin files are comments. When accounting for the licensing in every file, around 10% lines of Code (LoC) are comments. Inspecting large files shows that most of the classes do not contain many comments. As this appears to be consistent across the entire project, this is an indicator for large code debt.

Detekt shows that the MCC and code smells per 1000 LLoC are high for a project of its size. Detekt estimates that the time it would take to fix all code debt in Kotlin at 642 days, although no reasoning is given for this estimate. However, some of these code smells might not be issues; for instance, Detekt does not exclude generated files.

By running Detekt on several commits, once every year, code debt evolution was analyzed. Figure **401** shows that while the overall debt has grown massively, it has decreased compared to the LLoC. Figure **402** shows that the relative number of code smells has slightly decreased over time.

<figure class="image">
<img src="charts/DebtLLoCEvolution.png"  width="600" alt="{{ include.description }}">
<figcaption>
<b>Figure 401</b> - Comparison of the overall debt (in hours) and logical lines of code over time.
</figcaption>
</figure>
<figure class="image">
<img src="charts/CSLLoCEvolution.png"  width="600" alt="{{ include.description }}">
<figcaption>
<b>Figure 402</b> - The ratio between number of code smells and logical lines of code over time.
</figcaption>
</figure>

### Open TODOs

Unresolved TODOs in code are a good metric for known technical debt in the project, the analysis of the TODOs history can be seen in figure **403**.

In 2016, the amount of TODOs grew significantly from about 850 to over 3000. The developers added many TODOs in testing, especially in `idea` and `compiler`. Likely due to Kotlin being released around this time they did not resolve these issues right away, increasing the testing debt further.

Furthermore, the overall number of open TODOs is increasing, reaching more than 4000 in March 2019, indicating significant technical debt in the `idea` and `compiler` components. Not all this is necessarily bad, as long as they can be repaid \[30\]. The increasing number of TODOs does not however bode well as this also means the time to resolve these TODOs keeps increasing.

<figure class="image">
<img src="charts/TODOs-history-with-major-components.png"  width="900" alt="{{ include.description }}">
<figcaption>
<b>Figure 403</b> - History of TODOs since 2012 with main components, stacked amount of TODOs
</figcaption>
</figure>

Test Debt
---------

In this section the testing debt of Kotlin is analyzed, by looking at bugs and analyzing the test quality.

### Bugs

On YouTrack \[31\], all bugs in Kotlin are tracked with priorities and affected subsystems. The analysis focused on major and critical bugs, because these are the ones with the highest impact.

In the period from 2011 until March 2019, 2428 major and 629 critical bugs were fixed in Kotlin. However, 774 major and 5 critical bugs remain unfixed. An analysis of the issue tracker shows that critical bugs are likely to be resolved within a few months. However, major bugs stay unfixed much longer, some even for multiple years (see examples 1 \[32\], 2 \[33\], and 3 \[34\]. The main components affected by bugs are IDE, Frontend, Tools, and Backend (see figure **403**).

<figure class="image">
<img src="charts/Top10-Combined-Bugs-per-Module.png"  width="900" alt="{{ include.description }}">
<figcaption>
<b>Figure 404</b> - Top 10 affected subsystem by bugs with stacked amount of bugs and current state (March 2019)
</figcaption>
</figure>

### Test Quality

The current state of testing in Kotlin is difficult to assess, because analyzing test coverage is very difficult due to the project having more than 55.000 tests, while lacking test coverage tools.

TeamCity and IntelliJ IDEA do not support code coverage for the Kotlin language \[35\]. Since JetBrains likely does not track test coverage, they have a presumably high potential of test debt. Furthermore, the high amount of TODOs and their slow decline suggests JetBrains is aware of their testing debt, but is not prioritizing it.

To improve testing standards (see section [Standardization of testing](#Standardization%20of%20Testing)) JetBrains could create quality requirements and guidelines for open source developers. Furthermore, test reviews should be mandatory for pull requests, because testing is not checked in pull request reviews (see section Pull Request Analysis).

Design Debt
-----------

Since Kotlin is a large project, the internal dependencies are difficult to evaluate (see in section [Module Organization](#Modules)). It is evident that the internal structure is quite complex with many intertwined modules. This is an indicator of high coupling, and thus large code debt. Meaning it is tough to add changes to the system.

While analyzing the dependencies of Kotlin, older version of libraries were found. For instance, it appears that JUnit 4 is still used, which has been out-of-date for over a year.

One of the major dependencies of Kotlin is Java. Java 6 was deprecated in december 2018, but is still a listed dependency of Kotlin. This is probably due to Android still heavily depending on Java 6. Since Android is a target platform for Kotlin, this might be why Kotlin still wants to support Java 6.

Communication about Debt
------------------------

In this section we discuss how Kotlin developers communicate and discuss about technical debt.

Filtering issues on YouTrack on the keywords “refactoring”, “refactor”, “maintain”, “maintenance”, and “debt”, does not return any discussions about technical debt. Furthermore, there are no labels for technical debt of any kind. Filtering the commit messages with the same keywords results in more than 2000 commits with refactorings, but very few discussions about maintenance or refactoring. Additionally, only 20 TODOs (figure **404**) contain the words “refactor” or “maintain”. On their Slack \[10\] there are no dedicated channels for refactorings, testing or maintenance.

All these findings indicate that Kotlin developers very rarely discuss technical debt.

 

Development View
================

To analyse the development of Kotlin, we will take a look at the architecturally significant concerns. The approach as specified by Rozanski and Woods \[5\] will be used in this section.

Concerns
--------

### Modules

The Kotlin project repository is organized into modules and orchestrated using Gradle. Analyzing the build files of the project showed there are 199 modules.

[A dependency graph](diagrams/dependencies.pdf) has been created to show the links between each subproject. From this graph, it can be seen that sub-projects tend to have many dependencies to other sub-projects. Kotlin has multiple third-party dependencies such as, Java, JUnit, ANTLR 4, and Google Guava.

The top 10 nodes by amount of times referenced are the following:

<table><colgroup><col style="width: 24%" /><col style="width: 15%" /><col style="width: 59%" /></colgroup><thead><tr class="header"><th>Name</th><th>Times Referenced</th><th>Description</th></tr></thead><tbody><tr class="odd"><td><code>:kotlin-stdlib</code></td><td>68</td><td>Contains the Kotlin standard library <span class="citation" data-cites="stdlib">[36]</span>. Used in all Kotlin projects.</td></tr><tr class="even"><td><code>:idea</code></td><td>63</td><td>Contains all editor integration between IntelliJ IDEA and Kotlin adjacent projects.</td></tr><tr class="odd"><td><code>:compiler:frontend</code></td><td>59</td><td>Contains classes and methods to analyze Kotlin code, resolve types, and show diagnostic compiler messages.</td></tr><tr class="even"><td><code>:compiler:util</code></td><td>52</td><td>Contains various utilities ranging from constants to class conversions.</td></tr><tr class="odd"><td><code>:compiler:tests-common</code></td><td>44</td><td>Contains all kinds of boilerplate for creating language tests. Used in many projects.</td></tr><tr class="even"><td><code>:compiler</code></td><td>42</td><td>Groups all sub-modules together: contains no functionality on its own.</td></tr><tr class="odd"><td><code>:compiler:frontend.java</code></td><td>39</td><td>Contains behavior when the Kotlin compiler interacts with a Java source file.</td></tr><tr class="even"><td><code>:compiler:cli</code></td><td>32</td><td>Contains code for command line tools <code>kotlinc</code>, <code>kotlin-dce-js</code>, etc.</td></tr><tr class="odd"><td><code>:core:descriptors</code></td><td>27</td><td>Contains classes for naming Kotlin language elements and types.</td></tr><tr class="even"><td><code>:idea:core</code></td><td>27</td><td>Contains all editor integration between IntelliJ IDEA and Kotlin.</td></tr></tbody></table>

**Table 301** - Top 10 nodes by amount of times referenced

The full list can be found in [diagrams/node\_references.md](diagrams/node_references.md).

This list of top referenced nodes also shows points of common processing: nodes that are included often must contain some kind of functionality that is useful to share and distribute across other modules.

Furthermore, there have been 7 general layers of modules identified.

**The module structure graph** shows the general relationship between module layers.

<figure class="image">
<img src="diagrams/Module_structure.png" width="600"alt="{{ include.description }}">
<figcaption>
<b>Figure 501</b> - Diagram of the module structure.
</figcaption>
</figure>

### Standardization of design

There are not a lot of explicit rules or guidelines for standardizing the design of the Kotlin source code. The contributer’s guide \[37\] only specifies rules in regards to creating the pull request and communicating what this contributes to the project. The only code related check that needs to be done is that tests have to be written, run, and passed for the contribution. Aside from that, the current workflow appears to be to first look at similar contributions, and then attempt to be consistent with their style.

There is, however, a coding conventions document \[38\] for the Kotlin language. Since the Kotlin project is mainly written in Kotlin, this means these guidelines still apply for the source code contributions. Any pattern that can be used to make the contributed code more efficient would be mentioned in the review, but they are not defined beforehand.

### Standardization of testing

As was mentioned before, there is a requirement to create tests when submitting a pull request. Since there is a standardised way to create tests, this is a relatively easy process. For each type of feature, there is a package in which tests can be added. Tests can then be generated by Gradle, which can then also execute tests.

According to the contributor’s guide for Kotlin \[37\] every developer has to implement, run and pass all tests for their contributions. There are no further requirements or guidelines for testing.

JUnit 4 and automatically generated test collections are used to simplify test creation. For most types of test there is a file in the tests package that automatically generates code. This code will test the files it will find in the corresponding package in testdata. The tests are generated by running the “generate all tests” configuration in IntelliJ IDEA. All these tests are stored in multiple test suites regarding different modules of the system, e.g. testIDE or compiler.

### Instrumentation

For a programming language, instrumentation is a key property. Kotlin supports code tracing, debugging, profiling, and data logging.

To enable developers to debug their software, Kotlin complies \[39\] to the DWARF 2 debugging data format standard \[40\], allowing developers to use breakpoints, stepping, and inspections of types and variables.

Currently (March 2019), both Kotlin and IntelliJ IDEA do not have a native profiler for Kotlin, but decompiling Kotlin code to Java code allows to use JVM Profiler \[41\] shipped in the JVM. The compiler can target JVM, native, and JavaScript, which means tools for those environments can be used.

Every Throwable \[42\] object, the base class for exceptions and errors, contains a stacktrace array \[43\] with the last frames before occurrence. Like most languages, exceptions contain a message, stack trace and, if applicable, a cause \[44\].

Kotlin provides some options to profile software. Compiler Instrumentation \[44\] can be setup and used to profile an application during compilation. A more specific tool is the measureTime \[45\] function, measuring the runtime of a certain code block.

Logging can be done in a similar way to logging in Java. Furthermore, in IntelliJ IDEA many issues are identified and shown to the developer during code writing. This is an feature of Kotlin, giving direct feedback to Kotlin developers.

### Codeline Organisation

The codeline organisation \[5\] refers to the way the directory structure is managed and tested, while being regulated via configuration management. The management of the building and tests is done using Gradle. The testing itself is done using JUnit 3 and 4.

Furthermore, JetBrains uses TeamCity for an continuous integration and deployment process \[46\]. TeamCity runs a multitude of build agents on the latest master, creating new builds roughly every 3 hours, if all tests pass.

The file structure itself is confusing for newcomers. The project has not been structured in a clear and logical form, nor is there any documentation on how the structure for the Kotlin project should be organized. Nevertheless, an attempt was made to comprehensibly identify all the packages of the project and their purpose, which can be found in [diagrams/directories.md](diagrams/directories.md)

For people that are wanting to contribute, it is the easiest to start with looking at the `idea` folder, since this contains plugins for IntelliJ IDEA, such as inspections. Most of the up-for-grabs issues are also centered around this package.

The main issue with this set-up is, that there is no clear indication or grouping of any functionality. In order to contribute to Kotlin, a developer has to analyze other commits and pull request to get a basic understanding of the project.

In conclusion, there are issues with documentation and clarity in the Kotlin project. It would be beneficial to add more logical structuring and documentation, which would lead to people having an easier time contributing.

 

Contributors Perspective
========================

Kotlin is a project that partially relies on open source contributions in order to evolve and has welcome contributors since it was made open source in 2012 \[47\]. In order for these contributors to work effectively, they should be supported throughout the process. In this section the journey of contributiors throughout making contributions and proposing new features will be explored, before giving recommendations for potential improvements. This journey was derived from three personas (see Appendix Personas) and the contribution barriers (see figure **601**) identified by Steinmacher et al \[48\].

<figure class="image">
<img src="diagrams/contribution-barriers-steinmacher.jpg"  width="700" alt="{{ include.description }}">
<figcaption>
<b>Figure 601</b> - Barriers for new open source contributors found in a literature review by Steinmacher et al. in 2015 \[48\].
</figcaption>
</figure>

Orientation
-----------

In the orientation phase, the contributor sets up the development environment, picks an issue and gets familiar to the proceedings of Kotlin.

Finding all necessary files and documents on the Kotlin repository \[27\] such as `Readme.md` and `contributing.md` \[37\] was no problem for the contributors.

Furthermore, understanding how to propose a new feature for Kotlin via the Kotlin Evolution and Enhancement Process (KEEP) \[49\] is easy for new developers as it is well described. All things considered, the Kotlin KEEP process can take several month to years and requires long term effort.

Unfortunately, the issue tracker is confusing for contributors, because issues on the issue tracker that are up-for-grabs \[50\] is not as simple as suggested. Many of these filtered issues are already claimed, because contributors can claim issues by leaving a comment or already have a pull request pending, which is either tagged as such or not \[51\]. Thus, finding an issue to grab requires lots of manual inspection of the issue tracker and the Kotlin repository \[27\].

The build instructions are clear: JDKs 1.6, 1.7, 1.8, and 9 are required, with the former two being soft requirements \[27\]. It is not clear for developers if they can use the OpenJDK \[52\] instead of the Oracle JDK \[53\], as it appears to be operable as well.

To improve the start for contributors, the issue tracker could allow developers to claim an issue formally by adding a tag, such as “Grabbed” or “Doing”. Then, applying a filter would give a clear overview of the issue state. Furthermore, the Pull Request tag should be properly maintained such that pull requests that are pending do not show up in the filtered list. Additionally, it should be clear whether or not the OpenJDK can be used to contribute to Kotlin, as it is easier to get and install in certain environments.

Because KEEP is can be slow and very time consuming JetBrains should add further information on how to request features for Kotlin without making a large commitment.

Development and Testing
-----------------------

In this section, the development and testing experience for an open source contributor for Kotlin after an issue was chosen will be explored. This involves understanding the project organization, documentation, requirements, and implementation of the selected issue.

Starting to contribute to Kotlin can be difficult for developers, because the project structure is unclear and very difficult to assess (see section [Module Organization](#Modules)). Additionally, many functions especially used for inspections are uncommented and can be difficult to understand for a new contributor.

Since the 23th of March 2019, documentation especially for inspections and quickfixes has been added \[54\], teaching new contributors how to start with intentions and in which directories to look. This is a major improvement on the user experience, as a majority of Kotlin’s easy issues are related to Inspections and Intentions \[55\].

Writing tests is a challenge: the contribution guidelines \[37\] are unclear about the requirements for these tests, stating that related tests must be run locally and passed, and that all inspections should have automatic tests \[54\], but no mention of approaches or other requirements exist. The testing habits of other developers are also differing widely from very little testing \[56\] to sound tests \[57\]. Furthermore, many of the tests contain various test metadata, such as ‘Problem: NONE’, e.g. `inapplicable1.kt` \[58\], but they are not listed or documented.

Furthermore, there is no method to run tests with coverage: the related button in IntelliJ IDEA is broken for this project, leading to an error instead of coverage data.

The Kotlin developer community on their Slack \[10\] and helping with many issues developers face.

Documentation should be added for components that a new contributor is likely to use. When working on a new project, code documentation is an important part of understanding how components interact with each other. An example of this is `ProblemsHolder.registerProblem` \[59\], a function all inspections should call. However, there are three method overloads; documentation could inform a user which overload is appropriate for which situation. This is partially done with the new documentation for inspections and quickfixes \[54\].

Coverage information should be fixed for the Kotlin project so that information like statement coverage and branch coverage can be seen. This helps contributors identify missing test cases and improves the quality of contributor tests, positively impacting test debt (see section 4 - Testing Debt).

To help new contributors, a mentorship program could be created, where more experienced open source developers would assist newcomers. This approach is recommended by the open source guide as well \[60\]. Mentors can help newcomers to understand the technical details, coding guidelines, and rules of the project and thus, increase their productivity and quality of contributions.

Submission
----------

This section addresses the final steps for a contribution: submitting a pull request to the Kotlin repository and the review by project maintainers.

Submitting pull requests works without problems. In our experience the time between code submission and first review can vary between a day and three weeks. After it is accepted, the change is integrated into the `master` branch and is integrated in the project, automatically picked up by TeamCity to be included in a following release (see section 3 - Development Process).

The timespan of the PR review process should be lowered. This barrier was also identified by six of the reviewed studies by Steinmacher et al. (see figure **501**) and is also addressed in the opensource guide \[61\]. A long period of waiting can be demotivating for new contributors, because it can make your contribution feel insignificant after a lot of effort was poured into it. A good response time recommended in literature is below 48 hours \[62\].

 

Conclusion
==========

In this chapter, Kotlin was analyzed. Being a fairly new, but popular, language, Kotlin has attracted a lot of attention. Thus, it was important to first get an overview of the different stakeholders. It was found that evolution of the language is controlled by the Kotlin Foundation, and more specifically the Language Committee. Almost all of the people in this foundation represent one of the other two major stakeholders, JetBrains and Google.

All stakeholders are part of a broader context view. In this context view, it was found that Android is the largest platform for Kotlin. It also identified competitors such as Java or Swift. The tools that are used to develop JetBrains were also found, such as YouTrack for issue tracking, and TeamCity for continuous integration. Another important discovery is that Kotlin can be compiled to work on the JVM, JavaScript, and to native code.

Because Kotlin is open-source, anyone can contribute to the project. This means that there are more people able to look at and contribute to the project, leading to a potential decrease in technical debt. Looking at merged and unmerged pull-requests, discovered was that most PRs are usually merged to master after some time has elapsed.

Having identified the context of Kotlin, the next step was to zoom in to the development view. In this view, the different modules were identified and a diagram was made. Furthermore, the standardization of both design and testing was looked at. It was found that there is not really a standard for design, but there is a standard way to write tests, since there is a testing framework included in the project. There is also plenty of instrumentation available, helping developers to create and debug their code.

While researching the development view, time was also spent analyzing the potential technical debt of Kotlin, split in four different categories. It was found that Kotlin has significant debt in all categories. It was found that it would take an approximate 650 days to fix all the code debt, containing issues such as a lack of comments and a comparatively cyclomatic complexity. Additionally, there is a large number of open TODOs and bugs, however, these numbers are slowly declining over the years. This fact, coupled with no apparent analysis for test coverage, shows a sign of high test debt. Since there is also no open conversations that are visible about technical debt

The final perspective is the viewpoint of developers contributing to Kotlin. The section identified potential barriers for contributors based on experience and research. Three personas were created, through which the contribution process was analyzed and recommendations were given to improve this process. The most important recommendations were: improve documentation and test coverage, decrease the time waiting for review, and simplify the process of claiming issues.

Summarizing the results, Kotlin is a language that is starting to mature, and the fact that is open-source is helping with this. However, there are still a lot of issues that needs to be fixed, especially with regards of how easy it is for a new developer to contribute.

\[1\] Paul Krill, JetBrains readies jvm-based language, (2011). <https://www.infoworld.com/article/2622405/jetbrains-readies-jvm-based-language.html>.

\[2\] Maxim Shafirov, Kotlin on android. Now official, (2017). <https://blog.jetbrains.com/kotlin/2017/05/kotlin-on-android-now-official/>.

\[3\] AppBrain, Kotlin - android sdk statistics, (2019). <https://www.appbrain.com/stats/libraries/details/kotlin/kotlin>.

\[4\] Dmitry Jemerov, Kotlin 1.2 released: Sharing code between platforms, (2017). <https://blog.jetbrains.com/kotlin/2017/11/kotlin-1-2-released/>.

\[5\] N. Rozanski, E. Woods, Software systems architecture: Working with stakeholders using viewpoints and perspectives, Addison-Wesley, 2011.

\[6\] Dmitry Jemerov, Why jetbrains needs kotlin, (2011). <https://blog.jetbrains.com/kotlin/2011/08/why-jetbrains-needs-kotlin/>.

\[7\] JetBrains, Why jetbrains needs kotlin, (2018). <https://resources.jetbrains.com/storage/products/kotlinconf2018/slides/KC2018keynote_final.pdf>.

\[8\] Kotlin Foundation, Language committee guidelines, (2019). <https://kotlinlang.org/foundation/language-committee-guidelines.html>.

\[9\] Kotlin Foundation, Kotlin foundation, (2019). <https://kotlinlang.org/foundation/kotlin-foundation.html#lead-designer>.

\[10\] JetBrains s.r.o., Kotlinlang slack, (2019). <https://kotlinlang.slack.com>.

\[11\] GitHub, Inc., Search .Kt, (2019). <https://github.com/gradle/gradle/search?l=Kotlin&q=.kt>.

\[12\] JetBrains s.r.o., Community, (2019). <https://kotlinlang.org/community/>.

\[13\] Eugen Paraschiv, The state of java in 2018, (2018). <https://www.baeldung.com/java-in-2018>.

\[14\] Artur Bosch, Detekt, (2019). <https://arturbosch.github.io/detekt/>.

\[15\] Ilya Ryzhenkov, et. al., Documentation engine for kotlin, (2019). <https://github.com/Kotlin/dokka>.

\[16\] G. Johnson, K. Scholes, Exploring corporate strategy, prentice hall, Europe. (1999).

\[17\] Business Analyst Learnings, Stakeholder onion diagram: A practical guide, (2019). <https://businessanalystlearnings.com/ba-techniques/2013/1/22/how-to-draw-a-stakeholder-onion-diagram>.

\[18\] BAwiki, Stakeholder onion diagram, (2019). <http://bawiki.com/wiki/techniques/stakeholder-onion-diagram/>.

\[19\] D. Jemerov, S. Isakova, Kotlin in action, Manning Publications Company, 2017.

\[20\] Android Developers, Develop android apps with kotlin, (2019). <https://developer.android.com/kotlin#safer-code>.

\[21\] Kotlin Foundation, Kotlin javascript overview, (2019). <https://kotlinlang.org/docs/reference/js-overview.html>.

\[22\] Kotlin Foundation, Kotlin/native for native, (2019). <https://kotlinlang.org/docs/reference/native-overview.html>.

\[23\] JetBrains s.r.o., License, (2019). <https://github.com/JetBrains/kotlin/tree/master/license>.

\[24\] Kotlin Twitter, Kotlin twitter, (2019). <https://kotlinlang.org/foundation/kotlin-foundation.html#lead-designer>.

\[25\] Community, Kotlin reddit, (2019). [www.reddit.com/r/kotlin](www.reddit.com/r/kotlin).

\[26\] Kotlin Lang, Kotlin homepage, (2019). <https://kotlinlang.org/>.

\[27\] JetBrains s.r.o., The kotlin programming language, (2019). <https://github.com/JetBrains/kotlin>.

\[28\] GitHub inc., Mikhail glukhikh, (2019). <https://github.com/mglukhikh?>

\[29\] Tomas Topinka, Statistic, (2019). <https://plugins.jetbrains.com/plugin/4509-statistic>.

\[30\] E. Allman, Managing technical debt., Commun. ACM. 55 (2012) 50–55.

\[31\] JetBrains s.r.o., Kotlin (kt) - bug and issue tracker, (2019). <https://youtrack.jetbrains.com/issues/KT>.

\[32\] Svetlana Isakova, KT-9070, (2015). <https://youtrack.jetbrains.com/issue/KT-9070>.

\[33\] Hannes D., KT-11978, (2016). <https://youtrack.jetbrains.com/issue/KT-11978>.

\[34\] Eugene Petrenko, KT-16213, (2017). <https://youtrack.jetbrains.com/issue/KT-16213>.

\[35\] Irina Megorskaya, Code coverage, (2015). <https://confluence.jetbrains.com/display/TCD9/Code+Coverage>.

\[36\] Kotlin Lang, Kotlin standard library, (2019). <https://kotlinlang.org/api/latest/jvm/stdlib/index.html>.

\[37\] Nikolay Krasko, Contributing, (n.d.). <https://github.com/JetBrains/kotlin/blob/master/docs/contributing.md>.

\[38\] Kotlin Lang, Contributing, (2019). <https://kotlinlang.org/docs/reference/coding-conventions.html>.

\[39\] Kotlin Lang, Debugging, (2019). <https://kotlinlang.org/docs/reference/native/debugging.html>.

\[40\] Unix International, DWARF debugging information format, (1993). <http://dwarfstd.org/doc/dwarf-2.0.0.pdf>.

\[41\] Zlata Kalyuzhnaya, IntelliJ idea 2018.3 eap: Git submodules, jvm profiler (macOS and linux) and more, (2018). <https://blog.jetbrains.com/idea/tag/jvm-profiler/>.

\[42\] Kotlin Lang, Throwable, (2019). <https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-throwable/index.html>.

\[43\] Kotlin Lang, StackTrace, (2019). <https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/stack-trace.html>.

\[44\] Alexander Udalov, Andrey Breslav,, Exceptions, (2019). <https://kotlinlang.org/docs/reference/exceptions.html>.

\[45\] Kotlin Lang, MeasureTimeMillis, (2019). <https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.system/measure-time-millis.html>.

\[46\] Kotlin TeamCity, Kotlin teamcity, (2019). <https://teamcity.jetbrains.com/viewType.html?buildTypeId=Kotlin_dev_Compiler&branch_Kotlin_dev=%3Cdefault%3E&tab=buildTypeStatusDiv>.

\[47\] Ann Oreshnikova, Kotlin goes open source!, (2012). <https://blog.jetbrains.com/kotlin/2012/02/kotlin-goes-open-source-2/>.

\[48\] I. Steinmacher, M.A.G. Silva, M.A. Gerosa, D.F. Redmiles, A systematic literature review on the barriers faced by newcomers to open source software projects, Information and Software Technology. 59 (2015) 67–85.

\[49\] JetBrains s.r.o., KEEP - kotlin evolution and enhancement process, (2019). <https://github.com/Kotlin/KEEP>.

\[50\] JetBrains s.r.o., Tag: Up For Grabs and state: Open, (2019). <https://youtrack.jetbrains.com/issues/KT?q=tag:%20%7BUp%20For%20Grabs%7D%20and%20State:%20Open>.

\[51\] Burak Eregar, Convert java to kotlin dialog ask yes/no question but shows ok/cancel buttons, (2018). <https://youtrack.jetbrains.com/issue/KT-27869>.

\[52\] Oracle Corporation, OPEN jdk, (2019). <https://openjdk.java.net/>.

\[53\] Oracle Corporation, Java se downloads, (2019). <https://www.oracle.com/technetwork/java/javase/downloads/index.html>.

\[54\] Nikolay Krasko, Intention/quickfix/inspection quick notes, (2019). <https://github.com/JetBrains/kotlin/blob/master/docs/intentions_inspections_quickfixes.md>.

\[55\] JetBrains s.r.o., Up for grabsIDE. Inspections and Intentions, (2019). <https://youtrack.jetbrains.com/issues?q=%23%7BUp%20For%20Grabs%7D%20%23%7BIDE.%20Inspections%20and%20Intentions%7D>.

\[56\] Mikhail Glukhikh, Kotlin master, (2018). <https://github.com/JetBrains/kotlin/tree/master/idea/testData/inspectionsLocal/redundantSuspend>.

\[57\] Toshiaki Kameyama, Mikhail Glukhikh, Kotlin master, (2019). <https://github.com/JetBrains/kotlin/tree/master/idea/testData/inspectionsLocal/moveLambdaOutsideParentheses>.

\[58\] Toshiaki Kameyama, Kotlin master - inapplicable1.kt, (2018). <https://github.com/JetBrains/kotlin/blob/master/idea/testData/inspectionsLocal/moveLambdaOutsideParentheses/inapplicable1.kt>.

\[59\] Anna Kozlova et al., Intellij-community master, (2018). <https://github.com/JetBrains/intellij-community/blob/4999f5293e4307870020f1d0d672a3d35a52f22d/platform/analysis-api/src/com/intellij/codeInspection/ProblemsHolder.java>.

\[60\] Sophie Shepherd et al., Best practices for maintainers - learning to say no, (2016). <https://opensource.guide/best-practices/#learning-to-say-no).>

\[61\] Sophie Shepherd et al., Best practices for maintainers - documenting your processes, (2016). <https://opensource.guide/best-practices/#documenting-your-processes>.

\[62\] C. Jensen, S. King, V. Kuechler, Joining free/open source software communities: An analysis of newbies’ first interactions on project mailing lists, in: 2011 44th Hawaii International Conference on System Sciences, 2011: pp. 1–10. doi:[10.1109/HICSS.2011.264](https://doi.org/10.1109/HICSS.2011.264).
