---
name: pm
description: Start here when unsure which APMstack skill fits. The PM says what they are trying to do and this names the right skill and starts it.
---

# /pm: which skill?

The PM tells you what they are trying to do. Name the one skill that fits, say why in a sentence, and start it. Do not do the work yourself here, and do not offer a menu when one skill clearly fits.

## Steps

1. **Check PM home exists.** Read the one-line file `.apmstack` in the user's home directory, or look for an `apmstack/` folder containing `apmstack.md` in the current workspace. If there is neither, the answer is `/pm-setup`, whatever they asked for; say that their request comes straight after. If `apmstack.md` says `Example: yes`, mention once that they are on the bundled sample.
2. **If they have not said what they want,** ask one question and wait: "What are you trying to get done?"
3. **Match it.** When the size is unclear, go by this: a story shows the goal of one shippable part; an epic shows the goal of a whole feature and how it is measured; a program shows the overall product strategy; a bug says what went wrong and where to find it.

   | They want to | Skill |
   |---|---|
   | install, choose a folder, start over | `/pm-setup` |
   | teach APMstack their product, load documents, fix a stale fact, change product area | `/pm-domain` |
   | work out what the real problem is; they have a symptom, a complaint, a pile of data, or a feature someone asked for | `/pm-problem` |
   | write a one-pager, PRD or PR-FAQ | `/pm-spec` (it needs a problem statement first) |
   | write the strategy for a product area: outcomes, which epics, in what order, what is left out | `/pm-pgm` |
   | write an epic, feature (FTR) or initiative: one goal, several stories, other teams involved | `/pm-epic` |
   | break work into stories or tickets with acceptance criteria | `/pm-story` |
   | report something broken | `/pm-bug` |
   | find the numbers behind a story, epic or program, or ask someone for data that is not in the tools | `/pm-metrics` |
   | update a ticket that is already in Jira or Linear | the skill for that level; give it the key |
   | understand a competitor, or see what changed since last time | `/pm-compete` |
   | file a thought, meeting notes or a transcript; ask "what do we know about X"; run the weekly review; find material for a promotion case | `/pm-brain` |
   | hook up Jira, Linear, Slack, Notion or another tool, or change how one is used | `/pm-connect` |
   | get a document torn apart before the people in the room do it | `/pm-review` |

4. **Catch the common misroute.** Do not send them where they asked just because they asked. If they ask for a spec, stories, an epic or a roadmap item and what they describe is a solution ("we need a dashboard") with no problem statement in `domains/<active>/problems/`, say so and point to `/pm-problem` first. One sentence, no lecture. If they insist, send them where they asked.
5. **Not built yet.** Prioritisation, metrics design, discovery interview guides and synthesis, pre-mortems, roadmaps, launch plans and stakeholder updates are on the roadmap and have no skill. Say so plainly. Then name the nearest thing that helps, if one does: `/pm-problem` to sharpen the items before ranking them, `/pm-review` to pressure-test a plan or an update they have already written.
6. **Start it.** Answer in two lines at most: the skill and the reason. Then follow that skill's instructions as if they had typed the command. If that skill is not installed, say so and stop.
