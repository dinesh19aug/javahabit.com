---
title: "Git Commit Undo: Mastering Soft and Hard Resets for Local Commits"
date: 2023-09-20T20:58:19-04:00
author: Dinesh Arora
type: post
url: /how-to-undo-local-git-commits-soft-vs-hard-reset
image: "/resources/img/gitopps.png"
keywords:
  - Git reset  commands
  - Undo Git commit
  - Soft reset vs. hard reset
  - Git commit management
  - Version control with Git
  - Git tutorial
  - Git best practices
  - Local commit management
  - Git development workflow
  - GitHub repository management
  - Git undo changes
  - Effective Git commits
  - Code version control
  - Mastering Git reset
  - Developer's Git toolkit
categories:
  - Tech Notes
description: Unlock Git Mastery - How to Undo Local Commits (Soft vs. Hard Reset). Discover the essential Git skills you need to undo local commits effectively. Learn the difference between soft and hard resets and when to choose each. Boost your Git proficiency with this comprehensive guide!.
---

{{< featuredImage alt="featured image" >}}
Hey there, fellow developer! Ever committed something to Git and thought, "Oops, I need to take that back!"? We've all been there. The good news is that Git provides us with the tools to undo those local commits without a hassle. In this post, we'll explore why you might want to undo local commits and walk through the steps, including soft and hard resets, with real code samples.

{{< youtube ZGO5BgZIXRg >}}

{{< alert theme="info" dir="ltr" >}}

## Use Case: The Oops Moment

{{< /alert >}}
Imagine this common scenario: you're working on your latest project, happily making progress and committing changes along the way. Then, suddenly, you realize that your last commit was a premature one. Maybe you included a file you didn't mean to, or perhaps you discovered a bug right after committing. It happens, right?

That's when the need to undo local Git commits arises. We want to rewind the clock and make things right. Let's dig into how you can do that.

{{< alert theme="info" dir="ltr" >}}

## Soft Reset: When You Want to Keep Your Changes

{{< /alert >}}

### Use Case: Soft Reset

**Soft reset** is your go-to when you want to keep your changes from the undone commit staged in your working directory. It allows you to review and possibly modify the changes before committing again.

Here's how you do a soft reset:
{{< codes javascript >}}
{{< code >}}

```javascript
$ git reset --soft HEAD~1
```

{{< /code >}}

{{< /codes >}}

In this command, **HEAD~1** refers to the commit you want to undo. It moves the HEAD pointer back to the previous commit, effectively "uncommitting" your last change. Your changes remain staged and ready for editing.

{{< alert theme="info" dir="ltr" >}}

## Hard Reset: When You Want to Start Fresh

{{< /alert >}}

### Use Case: Hard Reset

On the flip side, there's the hard reset. This one's more drastic as it discards the changes from the undone commit entirely. You'd use this if you want to completely remove the last commit, including its changes, from your branch's history.

Here's how you do a hard reset:
{{< codes javascript >}}
{{< code >}}

```javascript
$ git reset --hard HEAD~1

```

{{< /code >}}

{{< /codes >}}

Be extra cautious with a hard reset because it permanently discards all changes from the last commit.

Let's see these resets in action with some code samples.

### Soft Reset

Suppose you committed a file called my-file.txt that you now want to uncommit but keep the changes staged.

{{< codes javascript >}}
{{< code >}}

```javascript
$ git log
$ git reset --soft HEAD~1
$ git status

```

{{< /code >}}

{{< /codes >}}

Now, the changes from the undone commit are staged, and you can make adjustments.

Edit **my-file.txt** to fix any issues.
{{< codes javascript >}}
{{< code >}}

```javascript
$ nano my-file.txt
```

{{< /code >}}

{{< /codes >}}

Commit the changes again.
{{< codes javascript >}}
{{< code >}}

```javascript
$ git commit -m "Your revised commit message here"

```

{{< /code >}}
{{< /codes >}}

### Hard Reset

Imagine you committed a file called **big-mistake.txt** that you absolutely need to remove from history.

{{< codes javascript >}}
{{< code >}}

```javascript
$ git log
$ git reset --hard HEAD~1

```

{{< /code >}}
{{< /codes >}}
That's it. The last commit, including all its changes, is gone forever.

## When should you use Soft or Hard Reset?

Undoing local Git commits is a valuable skill, and the choice between a **soft reset** and a **hard reset** depends on your specific situation:

- Use a **soft reset** when you want to keep the changes staged and ready for editing.
- Use a **hard reset** when you want to completely remove the last commit, including its changes.

Remember, communication is key when collaborating with others. Always inform your team about any changes to the Git history. So, the next time you find yourself in an "Oops" moment, don't worry. You've got the Git reset tools at your disposal to make things right.

Happy coding!
