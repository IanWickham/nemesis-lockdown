import 'dart:io';
/*
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

  print('$deck Remain in the deck.\n');//displays what was not picked
}
*/
class Card {
  String name;
  String picture;
  
  Card(this.name, this.picture);
  
  toString() {
    return name;
  }
}

class Deck {
  String deckName = '';
  List<Card> cards = [];
  String cardBack = '';

  //Lists the entire contents of the deck in order
  toString() {
    return cards.toString();
  }
  
  //Shuffles all cards of the deck randomly
  void shuffle() {
    cards.shuffle();
  }
  
  //Adds each card to the deck, later I will pass the image of the card as an arguement
  void generateDeck(List<String> names, List<String> images) {
    for(int i = 0; i<names.length; i++) {
      
        var card = Card(names[i], images[i]);  //stores the list of names, and the list of addresses to their image
        cards.add(card);

      }
    shuffle();
  }
  
  //returns the address of the image of top card
  String drawCard() {
  //print('Your card is ${cards[0]}.');
  return cards[0].picture;
  }

  //removes a card from the deck at a particular index
  void removeCard(int x) {
    cards.removeAt(x);
  }   
}

class CharacterDraft extends Deck {
    
  CharacterDraft() {                  //Constructor initializes the cards in the deck
    deckName = 'Character Draft';
    cardBack = 'assets/draft/back_of_card.png';
    var names = [
      'Hacker', 'Janitor',
      'Lab Rat', 'Sentry',
      'Survivor', 'Xenobiologist'
    ];
    var images = [
      'assets/draft/hacker.png', 'assets/draft/janitor.png',
      'assets/draft/lab_rat.png', 'assets/draft/sentry.png',
      'assets/draft/survivor.png', 'assets/draft/xenobiologist.png',
    ];
    generateDeck(names, images);
  }
  
//Performs the Character Draft according to the game rules. Does not work in dartpad as IO doesn't work.
  void performDraft(int players) {
    
    var input;      
    
    for(int i = 0; i < players; i++) {                                                   //Repeat for for however many players there are (1-5)
      print ('Pick (1)${cards[0]} or (2)${cards[1]}.');                                  //The deck was shuffled when it was created; displays the first 2 options
      input = stdin.readLineSync();                                                      //Takes a input from the user to let them choose. This will be done with widgets later.
      print ('You picked ${cards[int.parse(input) - 1]} as your character.');            //Displays the role the user chose
      removeCard(int.parse(input) - 1);                                                  //Removes the chosen card from the deck
      if(cards.length == 1) {                                                            //Checks if 5 players have been assigned roles and if so, leaves the loop
      print ('Maximum number of players reached!');
      break;                                           
      }
      shuffle();                                                                         //Shuffles the deck again
    }
  }
}

class ComputerActions extends Deck {         
    
  ComputerActions() {                                                   //Constructor initializes the cards in the deck
    deckName = 'Computer Actions';
    cardBack = 'assets/computer actions/back_of_card.png';
    var names = [
      'Computer Action A', 'Computer Action B',
      'Computer Action C', 'Computer Action D',
      'Computer Action E', 'Lock-Down'];
    var images = [
      'assets/computer actions/computer_actions_a.png', 'assets/computer actions/computer_actions_b.png',
      'assets/computer actions/computer_actions_c.png', 'assets/computer actions/computer_actions_d.png',
      'assets/computer actions/computer_actions_e.png', 'assets/computer actions/lock-down.png',
    ];
    generateDeck(names, images);
  }
}

class NightStalkerAttack extends Deck {
  NightStalkerAttack() {                                                //Constructor initializes the cards in the deck
    deckName = 'Night Stalker Attack';
    cardBack = 'assets/attack/back_of_card.png';
    var names = [
     'Blood Chase', 'Blood Chase', 'Blood Chase',                                                                       //3 cards
     'Blood Rage', 'Blood Rage',                                                                                        //2 cards
     'Cut', 'Cut', 'Cut', 'Cut', 'Cut',                                                                                 //5 cards
     'Evolve', 'Evolve',                                                                                                //2 cards
     'Infecting the Host',                                                                                              //1 card
     'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', 'Perched in the Dark', //5 cards
     'Piercing the Heart', 'Piercing the Heart',                                                                        //2 cards
      ];
    var images = [
      'assets/attack/blood_chase.png', 'assets/attack/blood_chase.png', 'assets/attack/blood_chase.png',
      'assets/attack/blood_rage.png', 'assets/attack/blood_chase.png',
      'assets/attack/cut.png', 'assets/attack/cut.png', 'assets/attack/cut.png', 'assets/attack/cut.png', 'assets/attack/cut.png',
      'assets/attack/evolve.png', 'assets/attack/evolve.png',
      'assets/attack/infecting_the_host.png',
      'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark.png',
      'assets/attack/piercing_the_heart.png', 'assets/attack/piercing_the_heart.png',
    ];
    generateDeck(names, images);
  }
}

class Event extends Deck {
  Event() {                                                             //Constructor initializes the cards in the deck
    deckName = 'Event';
    cardBack = 'assets/event/back_of_card.png';
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
      'Noise in Corridors', 'Noise in Corridors',             //2 cards
      'Panic', 'Panic',                                       //2 cards
      'Power Surge', 'Power Surge',                           //2 cards
      'Regeneration',                                         //1 card
      'Sanitary Network Failure',                             //1 card
      'Scent of Blood',                                       //1 card
      'Scent of Prey',                                        //1 card
      'Short Circuit', 'Short Circuit',                       //2 cards
      'That\'s Hot'                                           //1 card
      ];
    var images = [
      'assets/event/blood_trace.png', 'assets/event/blood_trace.png',
      'assets/event/blue_screen.png', 'assets/event/blue_screen.png',
      'assets/event/bulkheads_open.png', 'assets/event/bulkheads_open.png',
      'assets/event/consuming_fire.png', 'assets/event/consuming_fire.png',
      'assets/event/coolant_leak.png', 'assets/event/coolant_leak.png',
      'assets/event/damage.png', 'assets/event/damage.png',
      'assets/event/damaging_fire.png',
      'assets/event/eclosion.png',
      'assets/event/egg_protection.png', 'assets/event/egg_protection.png',
      'assets/event/fire_in_the_hole.png',
      'assets/event/hatching.png', 'assets/event/hatching.png',
      'assets/event/hunt.png', 'assets/event/hunt.png',
      'assets/event/kickstopper.png',
      'assets/event/leaving_the_shell.png', 'assets/event/leaving_the_shell.png',
      'assets/event/life_network_failure.png',
      'assets/event/lurking.png', 'assets/event/lurking.png',
      'assets/event/nest.png', 'assets/event/nest.png',
      'assets/event/noise_in_corridors.png', 'assets/event/noise_in_corridors.png',
      'assets/event/panic.png', 'assets/event/panic.png',
      'assets/event/power_surge.png', 'assets/event/power_surge.png',
      'assets/event/regeneration.png',
      'assets/event/sanitary_network_failure.png',
      'assets/event/scent_of_blood.png',
      'assets/event/scent_of_prey.png',
      'assets/event/short_circuit.png', 'assets/event/short_circuit.png',
      'assets/event/that\'s_hot.png'
    ];
    generateDeck(names, images);
  }
}



