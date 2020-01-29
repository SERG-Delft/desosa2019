---
chaptertitle: Eclipse Che
cover-image: images/eclipse-che.png
chapter: true
layout: default
project: eclipse-che
---

<!-- NOTE explicit page break -->

# Eclipse Che

**Gerben Oolbekkink (gjwoolbekkink), Ana Šemrov (asemrov), Yorick de Vries (yorickdevries), Rukai Yin (ryin)**


## Introduction

Eclipse Che is an open-source workspace server and an integrated cloud-based browser IDE, with the aim to offer a flexible, extensible, distributable and zero-install software development environment.

![Eclipse Che logo](./images/eclipse-che.png)

To put the project in a historical context, the eXo Platform first started with the idea of a cloud-based IDE in 2009 [^exo]. After three years of development and a substantial increase in popularity of the software, an investment was obtained to build a highly customizable commercial cloud development product and Codenvy was founded as a standalone business [^exo].

In 2014 Codenvy donated the intellectual rights to the Che kernel to *Eclipse Foundation* [^foundation] and Eclipse Che (named after Cherkasy, Ukraine, where most of the development takes place) was announced as one of the top-level projects of *Eclipse Cloud Development* [^ecd]. Codenvy then became a strategic member of the Eclipse Foundation, taking a board seat[^intro_che_tyler]. Nowadays Codenvy still bases its flagship product on Eclipse Che and was acquired by Red Hat in 2017[^redhat_codenvy], making Red Hat the biggest contributor to the project.

The Eclipse Che team believes in the future of cloud development. "Cloud development has the potential to turn organizations into lean, continuous operations and enable teams to release more frequently and ship faster", said Tyler Jewell, the Che project leader and former CEO of Codenvy[^intro_che_tyler]. The project thus aims to provide a cloud development solution with all the technologies, platforms, and protocols necessary in order to ease the path to global adoption of cloud development.

Developing in the cloud relies on development environments that can be built and set up easily, with one-click, greatly simplifying team onboarding and collaboration. Indeed, the vision the Che team has held for years is to allow anyone to contribute to a software project without the need of installing additional software[^openshift_che_tyler]. Compatible with multiple container orchestration systems, Che supports both single-user as well as multi-user development, which makes it more adaptable and supportive for teams. Furthermore, integrated within Red Hat's OpenShift.io platform, Che enables developers to run it as SaaS.

In addition, Eclipse Che is designed to be a platform where developers can also build and integrate their own development tools. By writing and adopting extensions, it is up to the vision and creativity of Che's users to create new solutions. This way, Che offers a similar to its desktop Eclipse counterpart - developers are given an extensible development environment, but accessible through the cloud[^intro_che_tyler].

In this report we analyze and provide a high-level understanding of the architecture of the Eclipse Che project. We first identify the key stakeholders of the project and describe the context of Che. We then analyze the technical debt and offer more insights from two viewpoints: a development view and a functional view. Since the Eclipse Che team just released both 6.19.3 and 7.0.0-beta-3.0 versions[^realease_che], we consider both Che 6 and 7 and discuss what the new Che 7 brings to the developers.

<!-- NOTE explicit page break -->

### Stakeholders

We have identified stakeholders of Che by analyzing the Che repository[^development-process], [Github's Insights](https://github.com/eclipse/che/pulse) and the official [Eclipse Che website](https://www.eclipse.org/che/). We will formulate this list mainly following the scheme defined by Rozanski and Woods in the book *Software Systems and Architecture*[^rozanski2011software],[^viewpoints].

#### Acquirers

Codenvy donated the Che kernel to Eclipse Foundation and has since been acquired by Red Hat, all while still continuing to build its commercial product on top of Eclipse Che. We thus consider Eclipse Foundation and especially Red Hat as the acquirers of Che.

#### Assessors

The project has two Eclipse Foundation assigned mentors - [Mik Kersten](https://twitter.com/mik_kersten) and [Marcel Bruch](https://twitter.com/marcelbruch), who is also a member of the Eclipse Foundation *Architecture council*.
They are the assessors of Che, as their main concerns are Che's continued technological success and innovation, widespread adoption, and future growth [^development-process].

### Communicators

Everyone with a role in Che's Development Process[^development-process] - including contributors, committers, reviewers, triagers, maintainers and project leaders - is expected to be a communicator of Che, since they understand the details of the architecture and can explain them, for example, to technical authors responsible for the documentation.

### Developers

All the contributors and committers to the project on GitHub are developers of Che. Most of the contributions come from Codenvy / Red Hat employees since Codenvy built the kernel of Che and the two organisations remain the major stakeholders of the project.

We list the top-five contributors by the number of commits (as of April 2019):

- [riuvshin](https://github.com/riuvshin)
- [sleshchenko](https://github.com/sleshchenko)
- [garagatyi](https://github.com/garagatyi)
- [benoitf](https://github.com/benoitf)
- [mshaposhnik](https://github.com/mshaposhnik)

### Maintainers

The Che development team lists all the project maintainers[^development-process], assigning them to different product areas including IDE, language servers, platform, dashboard, QA automation, and others.

The maintainers are responsible for managing the issue backlog, ensuring code quality and guiding technical decisions[^development-process]. Maintainers also periodically review pull requests (PRs) related to their respective product area - this is to make sure the PR reviewer lists are correct as well as to oversee the quality of the reviews themselves.

### Integrators

The integrator tasks are mostly done by the maintainers and codeowners. PR merges require the approval of at least one of the maintainers[^development-process][^development-workflow]. <!--Current maintainers include Vitalii Parfonov (IDE), Gennady Azarenkov (Architecture) and Sergii Kabashnyuk (Platform) among others.--> PRs that include documentation and release notes updates must also include a project manager (PM) reviewer. In addition, Tyler Jewell, one of the project leaders, can authorize the merging for any PR. The integrators take care that the reviewers focus on code style, readability of the code and usability for other developers.

Contributors with commit rights will merge their own PRs after all reviews are done, while those without commit rights will have the maintainer merge the PR instead. In addition, maintainers are responsible for periodically reviewing the open PRs[^development-process].

### Suppliers

Che is implemented mostly by Java and runs on top of Apache Tomcat by default. Part of the project is developed using [TypeScript](https://www.typescriptlang.org). It is built upon Docker 1.8+ and Maven 3.3.1+. The IDE used inside the browser used to be written using [GWT](http://www.gwtproject.org) until Che 6 and has been using [Theia](https://github.com/theia-ide/theia) since Che 7.

The Che project uses [GitHub](https://github.com/eclipse/che) for code version control, issue tracking and releases, and [Jenkins](https://jenkins.io) CI server hosted by Codenvy for continuous integration.

### Support Staff

Anyone can ask for support and request features using [GitHub issues](https://github.com/eclipse/che/issues). Weekly community meetings[^community-meeting], a public [Mattermost](https://mattermost.eclipse.org/eclipse/channels/eclipse-che) channel and a developer mailing list are all open for everyone to join and ask for help. Dave Neary, a Red Hat open source community manager, also acts as a community manager for Eclipse Che.

### System Administrators

In a company or organization, Che may be deployed by IT specialists in which case the IT department takes on the system administrator role. System administrators are concerned with Che's deployment, updates, plugin installations, and should be the first point of contact for users if anything goes wrong with Che.

Individual users who download, deploy and develop projects with Che are considered system administrators themselves. When Che is used as SaaS hosted at che.openshift.io, OpenShift assumes the role of system administrator instead.

### Testers

All contributors are supposed to be testers and are responsible for the code they submit. The Che development team requires all contributors to follow the Development Workflow[^development-workflow] for the purpose of submitting high-quality code.

### Users

We identified three classes of Che users.

*Application developers* are the primary users of Che. They can use it either with via the embedded browser IDE or instead with a different desktop IDE by mounting the Che workspace filesystem via SSH.

*Product owners* use Che by managing settings on the workspace server to provide on-demand workspaces for developer teams.

*Extension providers* make use of the Che SDK to extend and provide new customizations for Che.

### Competitors

There are several competitors to Che on the market, some of them open sourced and some not. Here we mention three main competitors:

- [Cloud9 IDE](https://aws.amazon.com/cloud9/) is another online integrated development environment and supports multiple programming languages developed by Amazon. It is written almost entirely in Javascript and published as open source from version 2.0.
- [Azure DevOps](https://azure.microsoft.com/en-us/services/devops/), formerly called VisualStudio Online before it was rebranded as Visual Studio Team Services (VSTS), is an online platform that supports [Team Foundation Server](https://visualstudio.microsoft.com/tfs/) and rolling release models.
- [Codeanywhere](https://codeanywhere.com) is another cross-platform cloud IDE created by Codeanywhere, Inc. It is written entirely in Javascript.

### People to Contact

We sent an email to the mailing list and showed our interest in talking with some developers. Dave Neary, the community manager, replied and invited us to attend the Che weekly meeting on April 1st, 2019 in which three developers Thomas Maeder, Stevan LeMeur and Sun Tan shared their opinions with us about why they thought Che is amazing and unique and challenges they've found, which we recorded in a [video](https://www.youtube.com/watch?v=ZS4FDH-MsZc).

### Power-Interest

In the figure below we classify stakeholders of the Che project using the power-interest grid[^mendelow1991stakeholder]. It indicates different levels of interest and power of stakeholders on the project. We then categorize the stakeholders into four groups in terms of how closely they need to be managed: key stakeholders which are to be managed closely, stakeholders to keep satisfied, ones that require minimal effort, and ones to keep informed.

![Power vs. interest grid for the Eclipse Che project][Power-interest]  
**Figure: Power vs. interest grid for the Eclipse Che project.**

[Power-interest]: ./images/Power-Interest_diag.png "Power vs. interest grid for the Eclipse Che project."

<!-- NOTE explicit page break -->

## Context View
In this section we give a further overview of the scope of Eclipse Che and describe how it is
positioned within its context.

### System Scope

Eclipse Che in its current form offers[^che-docs]:

- containerised development *workspaces* with an integrated browser IDE and runtimes configurable to include all project runtime dependencies the developers need
- *a workspace server* that orchestrates the workspace containers and deals with user management
- *plugins* which add support for various development services, including IDE support for specific programming languages, frameworks, and developer tools like debuggers
- an *SDK* for creating new plugins and shipping them by building new Che assemblies

### Context Model

We expand on the details already discussed in previous chapters by looking at the entities the
Eclipse Che project interacts with and categorising them, presenting them in a diagram, and briefly
describing each of the newly introduced ones.

![context model diagram][Context-view-diagram]

[Context-view-diagram]: ./images/Context-view.png "Context model diagram"

#### Organisation

With Codenvy having been an important driving force of the project since the very beginning, the
list of the current project leaders is not surprising - [Tyler
Jewell](https://github.com/TylerJewell) is the Codenvy founder and former CEO, [Gennady
Azarenkov](https://github.com/gazarenkov) was the Codenvy CTO and now works at Red Hat, and [Brad
Micklea](https://github.com/bmicklea) moved from Codenvy to RedHat as a product manager.
Furthermore, the project has two Eclipse Foundation assigned mentors.

#### Development
Eclipse Che is a *Java* project which uses *Maven* with several testing plugins as the project
builder and package manager. New releases of Che get built by a *Jenkins* CI server, while
*Sonarcloud* is used for continuous code quality checking and *Swagger.io* for building and
documenting APIs.

##### Connected services
Che runs on top of an application server and is deployed with *Tomcat* and *PostgreSQL* out of the
box. To build its IDE, Che relies either on *Eclipse Orion* (Che 6) or *Eclipse Theia* (Che 7).

Container orchestration is essential to install, run and manage Che, and the orchestrators
currently supported are *Docker*, *Kubernetes* and *OpenShift*. For multi-user Che, *Keycloak* is
used to handle user authentication and access management.

##### Project management
Most of the project management happens on *GitHub*, including issue tracking and version control.
The project also maintains a GitHub Wiki that details the project management and development
processes.

##### Licensed under / Follows
Eclipse Che is licensed under the *Eclipse Public License 2.0* and its maintainers follow and
enforce the *Contributor Covenant* Code of Conduct.

#### Community and support
The Eclipse Che community is active on multiple communication platforms. The project has an active
*mailing list*, a *Mattermost* channel, maintains a blog presence on *Medium*, and organises
biweekly videoconference Dev Meetings via *BlueJeans*. The project also organises an annual virtual
user conference *CheConf*.

<!-- NOTE explicit page break -->

## Technical Debt

### Technical debt in Eclipse Che
<!-- identifying technical debt: how’s the overall quality of the code? To that aim, you can run code quality tools (if available for your language), and/or perform a manual analysis on the system’s source code. While technical debt can take many forms, you might want to have a look at the SOLID violations. -->

<!-- Sonar is https://sonarcloud.io/project/issues?id=qurben_che&resolved=false -->

The project is split up in several modules. This helps in keeping coupling low, because different
modules can only interact if there is an explicit dependency defined in maven. Most classes are
very small, which helps in keeping cohesion high.

Running [Sonarcloud](https://sonarcloud.io/]) on the source code of Che some interesting outliers are
found. One of these is `ClientTestingMessage` in the testing plugin. This class violates SOLID by
keeping a reference to all classes that inherit this class. This can also cause further problems.

Another class which grabs the attention is `JGitConnection`, which is by far the largest class in
the project. This class is a very large adapter class for [jgit](https://www.eclipse.org/jgit/]), it
implements everything needed for git interaction in a single class.

The `CronExpression` class has the largest amount of technical debt according to Sonarcloud. This
class is very large, where it probably should not be. There are methods with very high
complexity, there is duplicated code and possible null pointers. Given that this class implements
something very specific that has nothing to do with this project, it should probably be moved to a
dependency.

The `MenuLockLayer` and `TextBox` classes have a D and E rating respectively. Both these classes
extend a class from [GWT](http://www.gwtproject.org/). The main issue with these classes according
to Sonarcloud is that the inheritance tree is too deep (larger than 5). It wouldn't be viable to
fix these issues, because the root of the issue lies in the dependency. For the next version of Che,
these classes are deprecated because a new IDE is introduced.

![Sonar maintainability rating][Sonar-maintainability]

[Sonar-maintainability]: ./images/sonar-maintainability.png "Sonarcloud maintainability rating"

<!-- List what they use -->

error [prone](https://errorprone.info/]) is used to report warnings about common errors.

### Test debt in Eclipse Che
<!-- identifying testing debt: is your system tested well? You can measure code coverage, discuss well- and less tested modules, and even describe their testing procedures. Can you also identify what actions should be taken if the testing should be improved? Adding more tests is an obvious one, but are there any factors impeding the simple addition of (effective) tests? -->

Eclipse Che is tested with JUnit (4900 Unit tests for individual modules) and Selenium (640
Integration tests between modules). The Selenium end-to-end tests test Che in a browser with an
automated user. Building and running the tests takes about three hours. The end-to-end tests take
about 2 hours to complete. These tests are only executed in pull requests when it is needed. There
are also nightly builds which allows QA to test changes rapidly. During development the contributor
SkorikSergey focusses on proper testing and gives advice on this for other contributors in Pull
Requests.

The test reports are run in a Jenkins Continuous Integration (CI)
[environment](https://ci.codenvycorp.com). In addition, a SonarCloud environment is available, but
hasn't been used since November
[2018](https://sonarcloud.io/dashboard?id=org.eclipse.che%3Ache-parent%3Amaster]). Code coverage
isn't taken directly into account into the Jenkins CI or SonarCloud environment.

We performed an analysis on the tested modules and the reports generated by a recent SonarCloud
analysis by our [team](https://sonarcloud.io/code?id=qurben_che]). In the testing degree Figure below, the lines of code are plotted against the number of
tests written for that module. The size of the bubble indicates the relative number of code smells
reported by SonarCloud.

In general, for the tested modules it is found that modules with more lines of code are tested with
more tests as well. Modules which are tested with relatively more tests tend to show a lesser
degree of code smells (docker-client, infrastructure-kubernetes) than modules with a lower number of
tests (`che-core-api-core`, `che-core-commons-gwt`).

![Overview of the tested classes, the size of the bubble represents average Code Smells per line of code.][Testing-degree]

[Testing-degree]: ./images/testing_degree.png "Overview of the tested classes, the size of the bubble represents average Code Smells per line of code."

In addition, it is observed that there exist quite some tests for the modules responsible for
permissions. This makes sense as assurance of the access security is very important to gain trust
from users. Bugs which lead to unauthorized access often lead to higher damage than functional
bugs. On the other side, plugin modules are barely or not tested at all. The choice for less
testing might lie in the more trivial code involved.

Our Sonarcloud analysis showed that in some modules there exists some code duplication. For example,
in the che-core-api-dto module 21.1% duplication is observed. However, additional analysis indicated
that this module is generating java code and deduplication in this module will likely lead to less
maintainable code. Lastly, it is found that for the Selenium tests, additional tests exist which
test whether the Selenium tests behave accordingly. These additional tests test whether mocked
classes have the right intended behaviour for example.

In general, testing is performed well in the project. Actions which can improve the testing
approach is to enable automatic coverage tools. This provides an indication of what is and isn't
tested in the project. Furthermore, it can be smart to make more use of the SonarCloud environment.

### Discussions about technical debt
<!-- discussions about technical debt: do developers discuss about technical debt in GitHub issues? Or are there TODO’s and FIXME’s in the source code? -->

There are sprint issues in the repository which are created for every two weeks. These issues have
a specific section on Technical Debt. In this section, there is a list of issues which are
considered technical debt and that should be fixed in that sprint. Issues themselves are not marked
as containing technical debt. 

There are about 150 TODO comments in the source code. Most of these were added in 2017 and there
are two authors who have contributed 90% of the TODO comments. It seems that most of these TODO
comments don't require some implementation as they have already been in the code for almost two
years. Several comments are in the GWT IDE, which is no longer under active development and is
a candidate for being moved to another repository.

### Evolution of technical debt
<!-- evolution of technical debt: investigate how the system evolved in terms of technical debt. -->

The Eclipse Che team has made a recent move from GWT to Theia as IDE with the release of [Che 7](https://che.eclipse.org/eclipse-che-7-is-coming-and-its-really-hot-1-4-64d79b75ca02). Theia is maintained in a separate repository and can also be used outside of [Che](https://github.com/eclipse/che-theia/). This
movement makes a coupling with Che very low and better maintainable. The team has moved to the
VSCode plugin protocol as well. This enables better modularisation for [plugins](https://github.com/eclipse/che-plugin-broker]). Both
movements help in lower technical dept.

Not much historical data is easily available as SonarCloud isn't run very often and older CI builds
aren't preserved long. It is found that tests are continuously developed during
[development](https://sonarcloud.io/project/activity?custom_metrics=tests&graph=custom&id=org.eclipse.che%3Ache-parent%3Amaster]).
Additionally, it is found that during development the number of code smells is also highly
[reduced](https://sonarcloud.io/project/activity?from=2018-10-03T10%3A00%3A00%2B0000&id=org.eclipse.che%3Ache-parent%3Amaster&selected_date=2018-10-04T15%3A08%3A37%2B0000&to=2018-10-20T10%3A00%3A00%2B0000]).

To get some more insight into the evolution of the project, we ran several major releases in our sonarcloud environment [4.0.0, 5.0.0, 6.0.0, 7.0.0-beta-1.0](https://sonarcloud.io/code?id=che-history).

![Evolution of number of code smells in Eclipse Che][Code-evolution]

[Code-evolution]: ./images/code_evolution.png "Evolution of number of code smells in Eclipse Che"

It was observed that the number of code smells highly dropped from Che version 5 onwards. Between
version 6 and 7, a major drop in code smells can be attributed to the removal of forked code from
Eclipse JDT in version 6.13.0. In addition, other dependencies are removed as well due to the move
from GWT to Theia.

<!-- NOTE explicit page break -->

## Development view

### Module structure

Eclipse Che source code is modularised and uses Maven to manage the dependencies between the
modules. On a high level, we analyse the module dependencies by looking at the way the Che assembly
binaries of the main system components are built. The components we considered are thus: the Che
workspace master (that is, the Che server), workspace loader, workspace agents (that run and manage
a workspace instance), IDE, and User Dashboard.

From a top level (in the Figure below), both the workspace server and the agents make use of the Che Core
module which contains shared APIs and libraries, while the Dashboard is a self-contained Web-based
module. The workspace agents make extensive use of Plugin modules which support IDE and other
workspace services. We follow the dependencies of both the workspace server and the agents further
in Figures below.

![Top level module relationships][structure]

![Workspace server module relationships][wsmaster]

![Workspace agent module relationships}][wsagent]

[structure]: ./images/structure.png "Figure 1: Top level module relationships"
[wsmaster]: ./images/wsmaster.png "Figure 2: Workspace server module relationships"
[wsagent]: ./images/wsagent.png "Figure 3: Workspace agent module relationships"

### Common design model

#### Core APIs

The Core APIs used in Eclipse Che are in the `core/che-core-api-core` module, including
definitions of JSON-RPC and REST operations, event subscription, unsubscription and notification,
web socket, proxy authenticators and password encryptors, and standard API exception formats.

#### Database interaction

Database interactions are defined in the `core/che-core-db` module — for example, database initialization and termination, SQL script creation and migration, common database error codes as well as data source tracing methods.

#### Shared libraries

Most of the shared libraries for the server, agents and plugins are in the `core/commons` module. Some examples of these libraries include ones that handle Single Sign-On (SSO) token extraction and authentication exceptions, JSON parsing and writing, and e-mail services.

#### Logging and instrumentation

Che uses SLF4J and Logback for logging within the browser IDE and on server-side, respectively. Che also exposes metrics in a format that can be consumed by a [Prometheus](https://prometheus.io) server and visualised in [Grafana](https://grafana.com/) - this includes metrics from the JVM, the class loader, and the Tomcat server. Che also supports the collection of end-to-end trace data by deploying a [Jaeger](https://www.jaegertracing.io/]) server.

#### Third-party libraries

Eclipse Che relies on a set of third-party libraries each of which serves independently, such as Google Web Toolkit and Tomcat, SLF4J for message logging, Swagger for API design, and Javax for email services and web socket applications.

#### Design pattern: "Sidecar container"

In this cloud development design pattern, the sidecar containers are attached to the parent application container and are used to provide supporting features to the main application. Sidecar containers can follow their own development and runtime lifecycle, allowing for easy upgrades and modifications.

This design pattern became prominent with the new Che 7. Previously, all the dependencies required for active development within a workspace had to be injected into the main workspace container image. This meant that the development container image used in the workspace was not identical to the production image anymore. To address this and avoid having to modify the production image clone, the sidecar container pattern was employed in order to organise the workspace containerisation.

The various services that used to be parts of a workspace have thus been split into separate containers (as seen in the Figure below), providing further isolation and encapsulation. The main workspace container does not need to have extra plugins installed anymore, as any additional workspace services and plugins will run in separate sidecars.

![Sidecar containers][Sidecar]

[Sidecar]: ./images/Sidecar.png "Sidecar containers"

##### Plugin brokers

Plugin brokers are special services that will, given a specific plugin metadata description, gather all the information about definitions already available on the Che server to and prepare the workspace for the plugin installation. This includes, for example, downloading and unpacking required files, returning a set of endpoints, containers (and even editors) for the plugin. The main goal of using a plugin broker is to decouple the Che plugin setup from the Che server itself, allowing Che to support different kinds of plugins without having to modify the Che server code for every new kind of plugin added.

### Codeline model

#### Source code structure

We describe the overall, high-level structure of the source code repositories used by the project. The main codebase of course resides in the main Che GitHub repository; however, some of the source code the project depends on is contained in other repositories in order to allow for it to be managed separately.

##### Main Repo

The main Che source repository on GitHub has the following high-level
structure[^development-workflow], which generally follows the way Che is split into submodules.

|Directory         |Description|
|------------------|-------------------------------------------------------|
|/                 | Root directory
|/agents           | Workspace software (web terminal, language servers, ssh server)
|/assembly         | Generates binary assemblies of Che
|/core             | Shared libraries for server, agents, and plugins
|/dashboard        | JavaScript app user management
|/dockerfiles      | Docker images to run Che, CLI, & utilities
|/ide              | Browser IDE
|/plugins          | IDE & workspace agent plugins
|/samples          | Code templates for fresh workspaces

<!-- NOTE explicit page break -->

##### Other Repos

Some of the Che dependencies are managed in other repositories owned either by the Eclipse
Foundation or Codenvy. This is done for multiple reasons[^development-workflow] — these
dependencies are either forks of other relevant projects, contain libraries that follow a different
tagging lifecycle than Che, or they contain very large files.

|Repository                     |Description|
|---------------------------------|-----------------------------------------------------|
|[eclipse/che-dev]                | Dev resources - code style, license headers
|[eclipse/che-dockerfiles]        | All project's Dockerfiles
|[eclipse/che-docs]               | Official Che docs
|[eclipse/che-lib]                | Dependencies forked from elsewhere (antlr, Orion, Tomcat, Logback, Swagger...)
|[eclipse/che-parent]             | Maven root parent POM, manages dependencies
|[eclipse/che-theia]              | New Che 7 IDE              
|[codenvy/che-installer]          | Windows and JAR installers
|[codenvy/che-tutorials]          | SDK examples and tutorials
|[che-incubator/chectl]           | Command line interface for Che
|[redhat-developer/rh-che]        | Eclipse Che on OpenShift
|[redhat-developer/devfile]       | Che 7 devfile specification

<!-- These are intentionally kept as hyperlinks -->
[eclipse/che-dev]: https://github.com/eclipse/che-dev
[eclipse/che-dockerfiles]: https://github.com/eclipse/che-dockerfiles
[eclipse/che-docs]: https://github.com/eclipse/che-docs
[eclipse/che-lib]: https://github.com/eclipse/che-lib
[eclipse/che-parent]: https://github.com/eclipse/che-parent
[eclipse/che-theia]: https://github.com/eclipse/che-theia
[codenvy/che-installer]: https://github.com/codenvy/che-installer
[codenvy/che-tutorials]: https://github.com/codenvy/che-tutorials
[che-incubator/chectl]: https://github.com/che-incubator/chectl
[redhat-developer/rh-che]: https://github.com/redhat-developer/rh-che
[redhat-developer/devfile]: https://github.com/redhat-developer/devfile


The source code for the official Eclipse Che [website](https://www.eclipse.org/che/]) is tracked on the Eclipse Foundation git repository:

```
http://git.eclipse.org/c/www.eclipse.org/che.git
```

#### Build - Integrate - Test - Release Cycle

Once it's clear where and how the project's source code is stored, a pipeline has to be designed
which takes the source code, builds it and tests it in order to finally bring it to release-ready
shape. In this section we discuss how Che tackles this by describing how the project is built,
changes integrated and tested stages, but also how the new versions get released.

##### Building Che

Che manages dependencies and builds the project with Apache [Maven](https://maven.apache.org/]).
Docker is used to provide container images that contain Che and all its dependencies. In addition,
the Web-based user dashboard also makes use of [yarn](https://yarnpkg.com/en/], [webpack](https://webpack.js.org/) and [gulp.js](https://gulpjs.com/) for package management and
building, respectively.

##### Continuous integration

Continuous integration of committed code changes is executed on a Jenkins
[server](https://ci.codenvycorp.com) hosted by Codeenvy. The Eclipse Che project runs several
Jenkins CI jobs which are either "plain" builds (CI builds on git push to master, PR builds
triggered via PR comments, nightly builds) or specialised quality assurance builds with further
testing (ran nightly, for a release candidate, or for the final release version).

##### Testing

Below we give an overview of the kinds of automated testing done when working on Che.

| Test / analysis type    |             Used by Che             |
| ----------------------- | ---------------------------------   |
| Unit testing            |     JUnit, TestNG at build time     |
| Integration testing     |     JUnit, TestNG at build time     |
| Functional testing      |              Selenium               |
| Static analysis         | FindBugs, Error Prone at build time |
| Code style              |      Maven formatter plugin                  |
| Continuous code quality |             Sonarcloud              |

Unit and integration tests are run at build time using the Surefire plugin for Maven. Static
analysis is also integrated into the build phase with both FindBugs and Error Prone checking for
compile-time detectable Java bugs. Code style is checked using a Maven plugin that checks for
compliance with *Google Java style* formatting.

Further quality assurance is done via functional and end-to-end testing using Selenium.

Sonarcloud has been used for continuous static analysis of Che releases between versions 6.2 and
6.14 (the last check was done in November 2018). It is unclear why continuous code quality checks
do not seem to be run on a regular basis anymore.

#### Release process

Successfully built and tested new versions of Eclipse Che are released at the end of each 2-3 week
development cycle ("sprint"). The release process itself is automated and integrated into the
standard CI pipeline. Che *binaries* are tagged and compiled from release version source code using
Maven, whereas Docker is used to build and tag *container images*. If blocker bugs are found during
the final quality assurance phase, the release can be blocked and postponed until the end of the
next sprint.

#### Configuration management

Software configuration management prescribes how changes are tracked and managed in order to ensure
that repeatability and traceability are possible when collaborating on a software project. Here we
detail the tooling and configuration structures employed by the Che team to support the development
lifecycle.

##### Tooling

We first specify the configuration management tooling used by the Che team. We categorise them
following [Berczuk's](https://dzone.com/refcardz/software-configuration) list of tools needed for
configuration management.

| Tool type       |Used by the Che team|
| --------------- | ------------|
| Version control | Git         |
| Build Tool      | Maven       |
| CI Server       | [Jenkins](https://ci.codenvycorp.com)   |
| Artefact Repo   | [Nexus](https://oss.sonatype.org/content/repositories/snapshots/org/eclipse/che/])     |
| Doc System      | GitHub Wiki |

##### GitHub Configuration Structures

The Che team uses GitHub to track and control the development of lifecycle. We identify the type of
codelines used and their respective GitHub branches.

There are three types of codelines used:

- **Mainline**: The master branch containing the latest code which is well-tested and stable (as reported by the CI system),
- **Active development lines**: Multiple branches where new features or bug fixes are worked on (are "in progress" and are allowed to be failing)
- **Release line**: One branch at a time which contains the source code of the latest Che release.

The active development lines can live either in the main repository if the authors have contributor
access or in project forks. The latter is discouraged, however, when collaborating on long-lived
feature branches - it is easier to track changes if all the development happens on main repo
branches. In addition, feature branches have to be named after the matching GitHub issue number and
must be removed after they are merged to mainline.

When preparing to release a new version of the software, a release branch is created from the
master branch on the release candidate commit. Any potential bugs found after the release are fixed
on this release branch and the branch itself is reused if a bugfix release is necessary. Once a new
release is in progress, the previous release branch gets removed.

The Che team does not make extensive use of *tagging*. The only tags used are release version
numbers labelling the respective commits where the past and the current release lines branched off.

<!-- NOTE explicit page break -->

## Functional View

Eclipse Che consists of several components which together form the development
environment[^che-docs]. The functions of these components in the architecture, together with their
interactions are depicted in the functional view. Projects are contained in workspaces which are
hosted in a workspace server. These workspaces can subsequently be accessed by browser-based IDEs.
In addition, plugins can be implemented for which a Software Development Kit (SDK) is available.

![Functional architecture][functionalview]

[functionalview]: ./images/functional_view.png "Overview of the functional architecture of Eclipse Che"

### Workspace server
The workspace server of Eclipse Che is installed on a Server infrastructure (for example Apache
TomCat) and is the central access point for the workspaces it maintains. Single or multiple users
can access workspace via a Restful API connection. The different workspaces are isolated from each
other and cannot interact.

#### Workspaces
Workspaces are used by one or multiple users to develop projects. A workspace can have any number
of projects which can be connected to version control repositories (like git, mercurial or
subversion) as well. Every workspace can be accessed through an IDE specific for that workspace via
the browser. An API is used for interaction between the browser IDE and the workspace. In addition,
access via desktop IDEs is possible as well. Language services enable development support for
different languages of choice. Every workspace has one or multiple runtimes, using a host
environment. These runtimes are used to build, run, and debug projects like one would do locally
with for example maven. Workspaces can be exported to move them from one Che server to another. In
addition, it is possible to save and restore snapshots via a snapshot registry.

### Server infrastructure
Server infrastructures are used to make environments for the Che Server as well as environments for
the workspace runtimes to run their code in. The server environments make use of either Docker or
OpenShift to work. Users can either set up these on their local PC or on a central server. Local
installations can be used by single users for small projects. Such an installation is easier to
start with as no login is required[^che-single-multi]. Server installations can be used by multiple
users in development teams in organizations. In addition, it is also possible to use a server from
Redhat in the form of Software as a Service (SaaS). 

### SDK
Eclipse Che is made so it can be extended easily. Plugins can be made by plugin providers for
either the Che server, a workspace (also called an agent) or the browser IDE. For the development,
a Software Development Kit (SDK) is available which enables the packaging plugins into assemblies
for use in production. Several plugins are already available for elements like ones for languages,
frameworks and tools.

<!-- NOTE explicit page break -->

## Conclusions

We have analyzed the architecture of Eclipse Che, an open-source cloud IDE. It offers containerized
development workspaces and plugins to support various development services. Codenvy, Red Hat and
Eclipse Foundation are considered the most important stakeholders. We have identified integrators
and pull request merge strategies by pull request analysis. Each pull request needs to pass the
tests and code reviews before a maintainer approves its merge. The technical debt analysis shows
that the team is working hard to remove components from project which have a large amount of
technical debt. We also observed that tests help properly in reducing code smells. 

The development view provided us with more insights into the project. We have analyzed the module
structure, the codeline model and the common design model. Here the sidecar is one of the most
interesting design patterns used. The functional view depicts the components of Eclipse Che and
their interactions.

<!-- NOTE explicit page break -->

## References

[^exo]: Benjamin Mestrallet. From eXo Cloud IDE to Codenvy Raising 9 Million Dollars: A Brief History, 2013. [exoplatform.com](https://www.exoplatform.com/blog/2013/02/26/from-exo-cloud-ide-to-codenvy-raising-9-million-dollars-a-brief-history/)
[^foundation]: https://www.eclipse.org/org/foundation/]
[^ecd]: https://www.eclipse.org/ecd/
[^intro_che_tyler]: Tyler Jewell, Introducing Eclipse Che and Eclipse Cloud Development, 2014. [codenvy.com](https://blog.codenvy.com/introducing-eclipse-che-and-eclipse-cloud-development-3751ad699d07)
[^redhat_codenvy]: Tyler Jewell, Red Hat To Acquire Codenvy, 2017. [codenvy.com](https://blog.codenvy.com/redhat-acquires-codenvy-c84e1202a042)
[^openshift_che_tyler]: Tyler Jewell, OpenShift.io and Eclipse Che, 2017. [eclipse.org](https://che.eclipse.org/openshift-io-and-eclipse-che-97a89e045f28)
[^realease_che]: Eclipse Che: Release}, 2019. https://github.com/eclipse/che/releases
[^development-process]: Che Wiki: Development Process, 2019. https://github.com/eclipse/che/wiki/Development-Process
[^community-meeting]: Che Wiki: Community Meetings, 2019, https://github.com/eclipse/che/wiki/Che-Dev-Meetings
[^development-workflow]: Che Wiki: Development Workflow}, 2019, https://github.com/eclipse/che/wiki/Development-Workflow
[^mendelow1991stakeholder]: Aburey Mendelow, Stakeholder mapping. Proceedings of the 2nd international conference on information systems, Cambridge, MA, 1991.
[^rozanski2011software]: Nick Rozanski and Eoin Woods. Software systems architecture: working with stakeholders using viewpoints and perspectives. Addison-Wesley, 2011.
[^viewpoints]: Software Systems Architecture, 2019, https://www.viewpoints-and-perspectives.info
[^che-docs]: https://github.com/eclipse/che-docs]
[^che-single-multi]: Single and Multi-User Che, 2019. https://www.eclipse.org/che/docs/che-6/single-multi-user.html