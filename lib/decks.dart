class Card {
  String name;
  String picture;
  
  Card(this.name, this.picture);
  
  toString() {
    return name;
  }
}

class Token extends Card {

  int? blue;
  int? red;
  Token(super.name, super.picture, this.blue, this.red);
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

class TokenGrabBag extends Deck {

  List<Token> tokens = [];

  TokenGrabBag() {
    deckName = 'Intruder Token Grab Bag';

    var names = [
      'Nothing',
      'Larva', 'Larva', 'Larva', 'Larva', 'Larva', 'Larva', 'Larva',
      'Creeper', 'Creeper', 'Creeper',
      'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult',
      'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult',
      'Breeder', 'Breeder',
      'Queen'
    ];

    var images = [
      'assets/intruder tokens/blanktoken.png',
      'assets/intruder tokens/larvatoken.png', 'assets/intruder tokens/larvatoken.png', 'assets/intruder tokens/larvatoken.png',
      'assets/intruder tokens/larvatoken.png', 'assets/intruder tokens/larvatoken.png', 'assets/intruder tokens/larvatoken.png', 'assets/intruder tokens/larvatoken.png',
      'assets/intruder tokens/creepertoken.png', 'assets/intruder tokens/creepertoken.png', 'assets/intruder tokens/creepertoken.png',
      'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png',
      'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png',
      'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png',
      'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png', 'assets/intruder tokens/adulttoken.png',
      'assets/intruder tokens/breedertoken.png', 'assets/intruder tokens/breedertoken.png',
      'assets/intruder tokens/queentoken.png'
    ];

    var blue = [
      null,                       //blank blue value
      1, 1, 1, 1, 0, 0, 0,        //larvae blue values
      1, 1, 1,                    //creeper blue values
      2, 2, 2, 3, 3, 3,           //adult blue values
      1, 1, 1, 2, 2, 2,           //adult blue values
      2, 3,                       //breeder blue values
      4                           //queen blue value
    ];

    var red = [
      null,                       //blank red value
      2, 2, 2, 2, 1, 1, 1,        //larvae red values
      2, 2, 2,                    //creeper red values
      4, 4, 4, 4, 4, 4,           //adult red values
      3, 3, 3, 3, 3, 3,           //adult red values
      4, 4,                       //breeder red values
      4                           //queen red value
    ];
    generateGrabBag(names, images, blue, red);
  }
  @override
  void shuffle() {
    tokens.shuffle();
  }
  void generateGrabBag(List<String> names, List<String> images, List<int?> blue, List<int?> red) {
    for(int i = 0; i<names.length; i++) {

      var token = Token(names[i], images[i], blue[i], red[i]);  //stores the list of names, images, and stats
      tokens.add(token);
    }
    shuffle();
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
      'assets/computer actions/computer_action_a.png', 'assets/computer actions/computer_action_b.png',
      'assets/computer actions/computer_action_c.png', 'assets/computer actions/computer_action_d.png',
      'assets/computer actions/computer_action_e.png', 'assets/computer actions/lock-down.png',
    ];
    generateDeck(names, images);
  }
  void cycleTopCard() {
    Card temp = cards[0];
    for(int i = 0; i < cards.length-1; i++)
      {
        cards[i] = cards[i+1];
      }
    cards[cards.length-1] = temp;
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
      'assets/attack/blood_chase.png', 'assets/attack/blood_chase2.png', 'assets/attack/blood_chase3.png',
      'assets/attack/blood_rage.png', 'assets/attack/blood_rage2.png',
      'assets/attack/cut.png', 'assets/attack/cut2.png', 'assets/attack/cut3.png', 'assets/attack/cut4.png', 'assets/attack/cut5.png',
      'assets/attack/evolve.png', 'assets/attack/evolve2.png',
      'assets/attack/infecting_the_host.png',
      'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark.png', 'assets/attack/perched_in_the_dark2.png', 'assets/attack/perched_in_the_dark3.png', 'assets/attack/perched_in_the_dark4.png', 'assets/attack/perched_in_the_dark5.png',
      'assets/attack/piercing_the_heart.png', 'assets/attack/piercing_the_heart2.png',
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
      'Blue Screen',                                          //1 card
      'Bulkheads Open',                                       //1 card
      'Consuming Fire',                                       //1 card
      'Coolant Leak',                                         //1 card
      'Damage',                                               //1 card
      'Egg Protection',                                       //1 card
      'Fire in the Hole',                                     //1 card
      'Hatching',                                             //1 card
      'Kickstopper',                                          //1 card
      'Leaving the Shell', 'Leaving the Shell',               //2 cards
      'Lurking',                                              //1 card
      'Nest',                                                 //1 card
      'Noise in Corridors',                                   //1 card
      'Panic',                                                //1 card
      'Power Surge',                                          //1 card
      'Sanitary Network Failure',                             //1 card
      'Scent of Blood',                                       //1 card
      'Short Circuit',                                        //1 card
      'That\'s Hot'                                           //1 card
      ];
    var images = [
      'assets/event/blood_trace.png', 'assets/event/blood_trace2.png',
      'assets/event/blue_screen.png',
      'assets/event/bulkheads_open.png',
      'assets/event/consuming_fire.png',
      'assets/event/coolant_leak.png',
      'assets/event/damage.png',
      'assets/event/egg_protection.png',
      'assets/event/fire_in_the_hole.png',
      'assets/event/hatching.png',
      'assets/event/kickstopper.png',
      'assets/event/leaving_the_shell.png', 'assets/event/leaving_the_shell2.png',
      'assets/event/lurking.png',
      'assets/event/nest.png',
      'assets/event/noise_in_corridors.png',
      'assets/event/panic.png',
      'assets/event/power_surge.png',
      'assets/event/sanitary_network_failure.png',
      'assets/event/scent_of_blood.png',
      'assets/event/short_circuit.png',
      'assets/event/that\'s_hot.png'
    ];
    generateDeck(names, images);
  }
}





