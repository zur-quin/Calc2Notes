#import "./../../template_notes.typ": *
#import "@preview/exm:0.1.0": *

#show: template

#set page(
  paper: "us-letter",
  // header: align(right)[Name:#blank(150pt, "")],
  // footer: rect(fill: aqua)[Footer],
  number-align: center,
)

#set document(title: "Test 2 review and more")
// #title()
= U-Sub Speed Practice
Every integral below is evaluated with a single substitution. Find it, and rewrite as an integral in #auto-alt($u$) that we can antidifferentiate. You may need scratch paper

#table(
  align: (center + horizon, center + horizon, center + horizon),
  columns: (auto, 2fr, 5fr),
  table.header([*Integral*], [*substitution #auto-alt($u=...$)*], [*Integral in #auto-alt($u$)*]),
  [#auto-alt($ integral cos(2x) dif x $)], [#auto-alt($u=2x$)], [#auto-alt($ integral 1/2 cos(u) dif u $)],
  // [#auto-alt($ integral x e^(-x^2) dif x $)], [], [],
  [#auto-alt($ integral x^2 sqrt(x^3 + 1) dif x $)], [], [],
  [#auto-alt($ integral sin^2(theta) cos(theta) dif theta $)], [], [],
  [#auto-alt($ integral x^3/(x^4-5) dif x $)], [], [],
  [#auto-alt($ integral 1/x^2 sqrt(1+1/x) dif x $)], [], [],
  [#auto-alt($ integral 1/(7-4x) dif x $)], [], [],
  [#auto-alt($ integral e^(arcsin(x))/sqrt(1-x^2) dif x $)], [], [],
  // [#auto-alt($ integral 2^t/(2^t+3) dif t $)], [], [],
  [#auto-alt($ integral (- dif x)/root(3, (1-2x)^2) $)], [], [],
  // [#auto-alt($ integral (e^z + 1)/(e^z + z) dif z $)], [], [],
  [#auto-alt($ integral x^3 e^(-x^4) dif x $)], [], [],
  [#auto-alt($ integral (cos(pi/x))/x^2 dif x $)], [], [],
  [#auto-alt($ integral e^x (2+3e^x)^(3/2) dif x $)], [], [],
  [#auto-alt($ integral (2x)/(x^2+1) dif x $)], [], [],
  [#auto-alt($ integral (4x+3)/(4x^2 + 6x -1) dif x $)], [], [],
  [#auto-alt($ integral (1/x - e^-x) cos(e^(-x) + ln(x)) dif x $)], [], [],
  [#auto-alt($ integral 3x/(1+9x^2) dif x $)], [], [],
)
= Test topics
- 7.3 Trigonometric Substitutions (you might also brush up on 7.2 techniques, because you often need to do a trig integral after doing a trig sub)
- 7.4 Integration with Partial Fraction Decomposition (these often have u-sub and arctan(x) type integrals, so review those too)
- 7.5 Strategies for Integration (knowing the techniques you can use, when to use them, and how to combine them)
- 7.7 Approximate Integration
- 8.3 Center of Mass (and centroid of lamina)
- 4.4 L'Hospital's Rule for limits (indeterminate forms, which ones can we do l'H on, etc)
- 7.8 Improper Integrals (type 1 and 2)
- 8.5 Probability (PDFs, mean, median)

= Study Tips
+ Find 2-3 examples in your notes/webassign/quizzes for each section and mark them for review this weekend.
+ Go over each section's Learning Objectives from the typed notes. Find and rewrite any relevant formulas, theorem, and definitions. Knowing details like these is important for getting multiple choice questions right. In those problems the small details are emphasized, one little mistake or misunderstanding will likely lead you to one of the wrong answer options.
== How do I effectively review problems?
For each problem you review, we want to practice like you are taking the test, so do the following:
+ Write the problem out on paper or a whiteboard in a library study room or dorm lounge etc.
+ Set a 10 minute timer, and try to do the problem as best you can without looking at your notes or any solution.
+ After 10 minutes you should be at least near the end. If you are still making good progress you can finish the problem, but if you aren't progressing it is time to grade yourself.
+ If you are on your own, now get a different color marker or pen and grade yourself against the solution in the notes (or whatever solution you want). If you are with a group of classmates, trade and grade each other's work.
  - Don't be mean to each other (or yourself), this is a time to grow and build community together, but don't go too easy on each other either. Sometimes we are too nice to ourselves saying things like "oh, I'd get this on the test" when that might not be true.
  - Make a note of the things you got wrong to look over later.
  - Take turns presenting/teaching the correct solution to the other people in your study group. If you are alone, practice teaching the material to a friend on the phone or a stuffed animal or a picture of a famous person. Explaining (or pretending to explain) math to someone else is a great way to learn and identify gaps in your knowledge.
+ Repeat as often as needed.
+ Outside of this loop, make flashcards with the theorems, definitions, and formulas you find yourself forgetting. You might add common antiderivatives to these flashcards like knowing #auto-alt($integral 1/(1+x^2) dif x = arctan(x)$) and other inverse trig integrals. The best part is, you can save these to help you study for the final exam.

== Where do I find more practice?
- Each day's "Before class reading" assignments have a list of places to get more practice from.
  - Paul's online notes has a lot of practice problems and full solutions with explanations.
  - The textbook has a list of exercises for every section.
  - The guided notes have examples and solutions in video form.
  - The typed notes have examples that I try to have different from lecture, some with solutions.
- Reviewing the WebAssign problems and quizzes are good resources also.
  - WebAssign has "practice another" feature to let you try similar problems, and it will grade your answer for you.
  - The full quiz solutions are posted to Canvas in our Files menu.
- Calculus has not changed in many, many years.
  - If you are studying in the library, grab any calc textbook, find the topic name in the index, and find more problems to solve there.
  - Other cites similar to Paul's online notes exist, "Mathematics LibreTexts" is another similar cite with problems and solutions for a different university. The section numbering may be off but if you want practice on l'Hospital's rule just look up "l'Hospital rule" on these kinds of cites.
- These cites and resources are all made by real human mathematicians, so there aren't any math hallucinations. Just study the topics I gave you, and good luck

== How do I stay calm in the test?
Tests are stressful. One thing that might help is practicing far enough in advance to feel confident. This doesn't always make the stress go away. Practice deep breaths, bring a fidget toy or squeeze-able stress ball, or a small candy or treat to take a tiny break in the middle of the test with.

Getting a good nights rest, getting a large breakfast/lunch, and staying hydrated before an exam may be more effective than staying up late to study. Taking care of yourself physically is very important in these times. If you don't normally go for caffeinated beverages, maybe don't bring an energy drink to class. The extra caffeine can cause added anxiety and jitters that you might not want to deal with during the test.

Keep in mind that you are not your test score. So many outside factors can cause you to do better or worse on your test. Do your best, show what you know, and know that you are not lesser for getting things wrong. We are human and make mistakes, and that is not the end of the world. There is another test and a final after this to improve on too.



