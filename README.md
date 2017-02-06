# Tic Tac Toe (Deploy On Day One)


Welcome to Flatiron! 

You're going to be writing code every day that you're here, and today is no exception. Let's see what you remember from doing the prework and write a simple application. In this lab we'll check a few concepts. Most importantly, we are going to do some simple Swift work. Let's get started!

##Tips

- You'll have all day to complete this.
- If you feel stuck, ask your new best friends for help.
- Don't get bogged down in git (if you choose to use it)
	- Many of you will want to know the right way to do it, but however your team decides they want to tackle things is the right way to do it today.
- Types of questions you'll probably want to ask that we'd like you to decide with your group.
	- Should we all work on one computer or each do our own and use git to manage merging our work together?
	- How do we put all our changes into one repository?
- The most important things are getting something working and learning to work as a team. There really are no wrong answers. 
- Keep in mind that you don't need to build things in the order they are presented below! Start with the easiest possible thing that begins to attack the problem, and build from there.
- Have fun with your new best friends!

## Instructions

As you've just heard, we want to make sure you know that [imposter syndrome](http://en.wikipedia.org/wiki/Impostor_syndrome) is just a phase. Today we're going to get over our initial imposter syndrome by jumping right in. You'll be surprised at how much you already know and how fast you'll learn from your peers.

Your mission, the one you've already chosen to accept by being here today, is as follows:

Develop an application *with the person next to you* that runs in Xcode's simulator. Collaborate however you'd like: working on the same machine, each on your own, git, whatever! This appliation is meant to be a different kind of tic tac toe game. Some important notes to consider are as follows:


Some important hints and reminders:

* Ask your neighbor for help!
* Google your errors but don't google the entire solution for the game
* You'll want to write all of your code in the ViewController.swift file.
* If you finish early, think of other ways to make your user experience better!


## Player

Our `Player` type is an enum. It is implemented for you and looks like this:

```swift
enum Player {
    
    case x, o
    
    var image: UIImage {
        switch self {
        case .o:
            return #imageLiteral(resourceName: "OImage")
        case .x:
            return #imageLiteral(resourceName: "XImage")
        }
    }
    
}
```


Your first instruction is to read about enums [here](https://github.com/learn-co-curriculum/swift-enumerations-reading)




## Board

`win(for:)` is a method available to instances of `Board` that takes in one argument of type `Player`. When this method is called where you pass in an instance of `Player` you will see that the `Board` instance will animate and then display a large X or O.

There is also a `winner` stored property of type `Player` available to instances of `Board` which you can use and should be helpful.

## ViewController
If you navigate to the `ViewController.swift` file, you will be doing most of your work in the following function:

```swift
    func playerTurn(board: Board, position: Int) -> Player {
        
        
        
        return .x
        
        
        
    }
```

Note that if you were to run the app and tap on any of the spaces, an X would appear in every space. If instead we returned back `.o` then an O would appear in the selected space. Know that when you tap on any space, this `playerTurn(board:position:)` fires off. When it does, there are two arguments to the function you are given which you can work with. You are given the instance of the `board` tapped along with the `position` of where the tap occurred within that `board`.

Hint: The `Board` type has a stored property called `position` which is equal to where the board is on screen. The upper left tic tac toe board would have its `position` property set to 0. You should first add some prints statements here to print out `board.position` along with `position` to see what prints out to console.

## Advanced

You should now look to implement ULTIMATE TIC TAC TOE adhering to the rules mentioned [here](https://mathwithbaddrawings.com/2013/06/16/ultimate-tic-tac-toe/).

Create a label that will display the winner!

You should also look to add a computer player that will make a move after every one of your moves automatically.
