# Agile Git Hooks

This is a neat set of git hooks which are ment to improve worklow
in "agile" teams. Package contains the following hooks:

* **prepare-commit-msg** - It takes the Pivotal Tracker's story ID from
  the `.pivotal` dotfile content or `STORY` environment variable and
  prepends it to the commit message. If no story ID specified then
  does nothing and moves forward.

* **commit-msg** - Checks if commit message has proper format, including
  the Tracker's story ID. If not, then aborts the commit operation. 
  This hook can be skipped with `--no-verify` commit switch.

* **pre-commit** - Checks current branch, and if it's master then aborts
  the commit operation, due to policy that work should be done in feature
  branches. For small changes this hook can be also skipped with `--no-verify`
  commit switch.
  
## Installation 

Execute the following script in the project root directory:

    $ curl -L http://git.io/RCgZXQ | bash
    
## Usage

To work with Pivotal Tracker's story just add it to `.pivotal` file:

    $ echo 1234321 > .pivotal
    $ git commit -m "Done with something"

Now you'll be asked if the story you working on is ok, then magick
happens here and the commit message is transformed into:

    [#1234321] Done with something
    
You can also specify story ID inline, using `STORY` env variable:

    $ STORY=1234321 git commit -m "Done with something else"

You can also manually specify story ID in your commit message. If ther will
be no story assigned then script will ask you if it's fine.

If you will try to commit directly into master then hook will remind you
that you shouldn't do it. It will also ask you if you wanna continue or
not.

## Copyright

Released under the Weedware License.

I&I Chris Kowalik <chris@nu7hat.ch> hereby grant you with the license to 
use this work in any way you want as far as your usage is not related to 
war, brutality or any other kind of crime or evil. By using this work you 
agree to disseminate freedom and peace on our beautiful world.

Also if we meet someday and you consider this work to be useful for you, 
you can invite us to chill with a pipe of peace in return.
