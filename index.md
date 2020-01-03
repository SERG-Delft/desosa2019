---
layout: default
title: Delft Students on Software Architecture -- DESOSA 2019
overview: true
author:
- Arie van Deursen
- Maurício Aniche
- Andy Zaidman
date: December 2019, version 0.1
---

# Delft Students on Software Architecture: DESOSA 2019


**[Arie van Deursen], [Maurício Aniche], and [Andy Zaidman]**<br/>
*Delft University of Technology, The Netherlands, December 20, 2019*

[arie van deursen]: http://avandeursen.com
[Andy Zaidman]: http://www.st.ewi.tudelft.nl/~zaidman/
[maurício aniche]: http://www.mauricioaniche.com


We are proud to present the fifth edition of
_Delft Students on Software Architecture_, a collection of 25 architectural descriptions of open source software systems written by students from Delft University of Technology during a [master-level course][in4315] that took place in the spring of 2019.

[in4315]: https://se.ewi.tudelft.nl/delftswa2019/

In this course, teams of approximately 4 students could adopt an open source project of choice on GitHub.
The projects selected had to be sufficiently complex and actively maintained (one or more pull requests merged per day).

During an 8-week period, the students spent one third of their time on this course, and engaged with these systems in order to understand and describe their software architecture.

Inspired by Amy Brown and Greg Wilson's [Architecture of Open Source Applications][aosa], we decided to organize each description as a chapter, resulting in the present online book.



The chapters share several common themes, which are based on smaller assignments the students conducted as part of the course.
These themes cover different architectural 'theories' as available on the web or in textbooks.
The course used  Rozanski and Woods' [Software Systems Architecture][rw], and therefore several of their architectural [viewpoints] and [perspectives] recur.

[viewpoints]: http://www.viewpoints-and-perspectives.info/home/viewpoints/
[perspectives]: http://www.viewpoints-and-perspectives.info/home/perspectives/

The first theme is outward looking, focusing on the use of the system.
Thus, many of the chapters contain an explicit [stakeholder analysis], as well as a description of the [context] in which the systems operate.
These were based on available online documentation, as well as on an analysis of open and recently closed (GitHub) issues for these systems.

[context]: http://www.viewpoints-and-perspectives.info/home/viewpoints/context/
[stakeholder analysis]: http://www.mindtools.com/pages/article/newPPM_07.htm

A second theme involves the [development viewpoint][development], covering modules, layers, components, and their inter-dependencies.
Furthermore, it addresses integration and testing processes used for the system under analysis.

[development]: https://www.viewpoints-and-perspectives.info/home/viewpoints/development/

A third recurring theme is [technical debt][debt]. Large and long existing projects are commonly vulnerable to debt.
The students assessed the current debt in the systems and provided proposals on resolving this debt where possible.

[debt]: https://speakerdeck.com/avandeursen/lehman-versus-lehman-dealing-with-debt?slide=2

Besides these common themes, students were encouraged to include an analysis of additional [viewpoints] and [perspectives], addressing, e.g., security, privacy, regulatory, evolution, or product configuration aspects of the system they studied.


## First-Hand Experience

Last but not least, all students made a substantial effort to try to contribute to the actual projects.
With these contributions the students had the ability to interact with the community; they often discussed with other developers and architects of the systems. This provided them insights in the architectural trade-offs made in these systems.

Student contributions included documentation changes, bug fixes, refactorings, as well as small new features.



## Feedback

While we worked hard on the chapters to the best of our abilities, there might always be omissions and inaccuracies.
We value your feedback on any of the material in the book. For your feedback, you can:

* Open an issue on our [GitHub repository for this book][dswa.io].
* Offer an improvement to a chapter by posting a pull request on our [GitHub repository][dswa.io].
* Contact @[delftswa][dswa.tw] on Twitter.
* Send an email to Arie.vanDeursen at tudelft.nl.

[dswa.io]: https://github.com/serg-delft/desosa2019
[dswa.tw]: https://twitter.com/delftswa


## Acknowledgments

We would like to thank:

* Anand Kanav, Arjan Langerak, and Bernd Kreynen, who did an amazing job as teaching assistants to the course
* Our 2019 guest speakers Mike Ciavarella, Bert Wolter, Ayushi Rastogi, Xavier Devroey, Erci Greuter, Marco di Biase, and Matthias Noback.
* Alex Nederlof and Michael de Jong who were instrumental in the earlier editions of this course.
* All open source developers who helpfully responded to the student's questions and contributions.

## Previous DESOSA editions

1. Arie van Deursen, Maurício Aniche, Andy Zaidman, Liam Clark, Gijs Weterings and Romi Kharisnawan (editors). Delft Students on Software Architecture: [DESOSA 2018], 2018.
1. Arie van Deursen, Maurício Aniche, Andy Zaidman, Valentine Mairet, Sander van den Oever (editors). Delft Students on Software Architecture: [DESOSA 2017], 2017.
1. Arie van Deursen, Maurício Aniche, Joop Aué (editors). Delft Students on Software Architecture: [DESOSA 2016], 2016.
1. Arie van Deursen and Rogier Slag (editors). Delft Students on Software Architecture: DESOSA 2015. [DESOSA 2015], 2015.

[DESOSA 2018]: https://delftswa.gitbooks.io/desosa2018/
[DESOSA 2017]: https://delftswa.gitbooks.io/desosa-2017/content/
[DESOSA 2016]: https://delftswa.gitbooks.io/desosa2016/content/
[DESOSA 2015]: https://delftswa.github.io/

## Further Reading

1. Arie van Deursen, Maurício Aniche, Joop Aué, Rogier Slag, Michael de Jong, Alex Nederlof, Eric Bouwers. [A Collaborative Approach to Teach Software Architecture][sigcse]. 48th ACM Technical Symposium on Computer Science Education (SIGCSE), 2017.
1. Arie van Deursen, Alex Nederlof, and Eric Bouwers. Teaching Software Architecture: with GitHub! [avandeursen.com][teaching-swa], December 2013.
1. Amy Brown and Greg Wilson (editors). [The Architecture of Open Source Applications][aosa]. Volumes 1-2, 2012.
1. Nick Rozanski and Eoin Woods. [Software Systems Architecture: Working with Stakeholders Using Viewpoints and Perspectives][rw]. Addison-Wesley, 2012, 2nd edition.

[sigcse]: https://pure.tudelft.nl/portal/en/publications/a-collaborative-approach-to-teaching-software-architecture(0c7f2aeb-f2d6-4c56-9ab7-5f47f73d133f).html
[teaching-swa]: http://avandeursen.com/2013/12/30/teaching-software-architecture-with-github/
[rw]: http://www.viewpoints-and-perspectives.info/
[aosa]: http://aosabook.org/


## Copyright and License

The copyright of the chapters is with the authors of the chapters. All chapters are licensed under the [Creative Commons Attribution 4.0 International License][cc-by].
Reuse of the material is permitted, provided adequate attribution (such as a link to chapter on the [DESOSA book site][desosa]) is included.

Cover image: Église Saint-Pierre de Firminy, Le Corbusier. [Wikimedia](https://en.wikipedia.org/wiki/File:EgliseSaintPierreLeCorbusierFirminy.jpg)


[![Creative Commons](img/cc-by.png)][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[desosa]: http://delftswa.github.io/
