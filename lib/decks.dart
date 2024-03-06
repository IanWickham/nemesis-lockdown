import 'dart:io';

void main() {
  //DeckTest();
  CharacterDraftTest();
}

void DeckTest() {                                   //A simple test to display the contents of the multiple types of decks
  var CDdeck = new CharacterDraft();
  var Edeck = new Event();
  var NSAdeck = new NightStalkerAttack();
  var CAdeck = new ComputerActions();
  
  print('This is the ' + CDdeck.deckName + ' deck.');
  print(CDdeck.toString() + '\n');
  print('This is the ' + Edeck.deckName + ' deck.');
  print(Edeck.toString() + '\n');
  print('This is the ' + NSAdeck.deckName + ' deck.');
  print(NSAdeck.toString() + '\n');
  print('This is the ' + CAdeck.deckName + ' deck.');
  print(CAdeck.toString() + '\n');
}

void CharacterDraftTest() {                         //Tests the performDraft function in the CharacterDraft deck
  var deck = new CharacterDraft();
  print('Performing a Character Draft:');
  deck.performDraft(8);                             //performs draft for a number of players (max 5)

  print(deck.toString() + ' Remain in the deck.\n');//displays what was not picked
}

class Card {
  String name;
  //String picture;
  
  Card(this.name);
  
  toString() {
    return name;
  }
}

class Deck {
  String deckName = '';
  List<Card> cards = [];
  
  //Lists the entire contents of the deck in order
  toString() {
    return cards.toString();
  }
  
  //Shuffles all cards of the deck randomly
  void shuffle() {
    cards.shuffle();
  }
  
  //Adds each card to the deck, later I will pass the image of the card as an arguement
  void generateDeck(List<String> namelist) {
    
    for(var name in namelist) {
      
        var card = new Card(name);
        this.cards.add(card);
      /*
       * Add the "store image" functionality here
      */
      }
    this.shuffle();
  }
  
  //Displays the card at the top of the deck.
  void drawCard() {
  print('Your card is ' + cards[0].toString() + '.');
    //Later, display the image here
  }
  
  //removes a card from the deck at a particular index
  void removeCard(int x) {
    this.cards.removeAt(x);
  }   
}

class CharacterDraft extends Deck {
    
  CharacterDraft() {                                                     //Constructor initializes the cards in the deck
    this.deckName = 'Character Draft';
    var names = ['Hacker', 'Janitor', 'Lab Rat', 'Sentry', 'Survivor', 'Xenobiologist'];
    this.generateDeck(names);
  }
  
//Performs the Character Draft according to the game rules. Does not work in dartpad as IO doesn't work.
  void performDraft(int players) {
    
    var input;      
    
    for(int i = 0; i < players; i++) {                                                        //Repeat for for however many players there are (1-5)
      print ('Pick (1)' + cards[0].toString() + ' or (2)' + cards[1].toString() + '.');       //The deck was shuffled when it was created; displays the first 2 options
      input = stdin.readLineSync();                                                           //Takes a input from the user to let them choose. This will be done with widgets later.
      print ('You picked ' + cards[int.parse(input) - 1].toString() + ' as your character.'); //Displays the role the user chose
      this.removeCard(int.parse(input) - 1);                                                  //Removes the chosen card from the deck
      if(this.cards.length == 1) {                                                            //Checks if 5 players have been assigned roles and if so, leaves the loop
      print ('Maximum number of players reached!');
      break;                                           
      }    
      this.shuffle();                                                                         //Shuffles the deck again
    }
  }
}

class ComputerActions extends Deck {         
    
  ComputerActions() {                                                   //Constructor initializes the cards in the deck
    this.deckName = 'Computer Actions';
    var names = ['Computer Action A', 'Computer Action B', 'Computer Action C', 'Computer Action D', 'Computer Action E', 'Lock-Down'];
    this.generateDeck(names);
  }
}


class NightStalkerAttack extends Deck {
  NightStalkerAttack() {                                                //Constructor initializes the cards in the deck
    this.deckName = 'Night Stalker Attack';
    var names = [
     'Blood Chase', 'Blood Chase', 'Blood Chase',                                                                       //3 cards
     'Blood Rage', 'Blood Rage',                                                                                        //2 cards
     'Cut', 'Cut', 'Cut', 'Cut', 'Cut',                                                                                 //5 cards
     'Evolve', 'Evolve',                                                                                                //2 cards
     'Infecting the Host',                                                                                              //1 card
     'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', //5 cards
     'Piercing the Heart', 'Piercing the Heart',                                                                        //2 cards
      ];
  this.generateDeck(names);
  }
}


class Event extends Deck {
  Event() {                                                             //Constructor initializes the cards in the deck
    this.deckName = 'Event';
    var names = [
      'Blood Trace', 'Blood Trace',                           //2 cards
      'Blue Screen', 'Blue Screen',                           //2 cards
      'Bulkheads Open', 'Bulkheads Open',                     //2 cards
      'Consuming Fire', 'Consuming Fire',                     //2 cards
      'Coolant Leak', 'Coolant Leak',                         //2 cards
      'Damage', 'Damage',                                     //2 cards
      'Damaging Fire',                                        //1 card
      'Eclosion',                                             //1 card
      'Egg Protection', 'Egg Protection',                     //2 cards
      'Fire in the Hole',                                     //1 card
      'Hatching', 'Hatching',                                 //2 cards
      'Hunt', 'Hunt',                                         //2 cards
      'Kickstopper',                                          //1 card
      'Leaving the Shell', 'Leaving the Shell',               //2 cards
      'Life Network Failure',                                 //1 card
      'Lurking', 'Lurking',                                   //2 cards
      'Nest', 'Nest',                                         //2 cards
      'Noise in the Corridors', 'Noise in the Corridors',     //2 cards
      'Panic', 'Panic',                                       //2 cards
      'Power Surge', 'Power Surge',                           //2 cards
      'Regeneration',                                         //1 card
      'Sanitary Network Failure',                             //1 card
      'Scent of Blood',                                       //1 card
      'Scent of Prey',                                        //1 card
      'Short Circuit', 'Short Circuit',                       //2 cards
      'That\'s Hot'                                           //1 card
      ];
  this.generateDeck(names);
  }
}



