package TexasPokerEngine;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;

import TexasPokerAction.Action;

public class Player implements Comparable<Player> {

	/** Pos. */
	private int pos;

	private String email;

	/** Name. */
	private String name;

	private int avatar;

	/** Client application responsible for the actual behavior. */
	private Client client;

	/** Hand of cards. */
	private Hand hand;

	/** Current amount of cash. */
	private BigDecimal cash;
	public BigDecimal prevCash;
	public BigDecimal winCash;

	/** Whether the player has hole cards. */
	private boolean hasCards;

	/** Current bet. */
	private BigDecimal bet;

	/** Last action performed. */
	private Action action;
	
	public PlayerStatus playerStatus;
	public String status;
	public String handValue;

	public int raise;

	public boolean isAddChip = false;
	public long newChip;

	private boolean isBot;
	public boolean isActive = false;
	public boolean isExit = true;
	public boolean isDone = false;
	public boolean isShow = false;
	public boolean isWinner = false;
	public boolean isAutoRebuy = false;

	public int giftCategory;
	public int giftDetail;

	/**
	 * Constructor.
	 * 
	 * @param name
	 *            The player's name.
	 * @param cash
	 *            The player's starting amount of cash.
	 * @param client
	 *            The client application.
	 */
	public Player() {
		playerStatus = PlayerStatus.NONE;
		hand = new Hand();
		resetHand();
	}
	
	public void join(boolean _isBot, boolean _isRebuy, Client client, int _pos, String email, String name, int _avatar, BigDecimal cash, int giftCate, int giftVal)
	{
		playerStatus = PlayerStatus.NEW;

		this.pos = _pos;
		this.email = email;
		this.name = name;
		this.avatar = _avatar;
		this.newChip = cash.longValue();
		this.cash = cash;
		this.client = client;
		this.isBot = _isBot;
		this.isAutoRebuy = _isRebuy;
		this.giftCategory = giftCate;
		this.giftDetail = giftVal;
		isExit = false;

		resetHand();
	}
	
	public void leave()
	{
		playerStatus = PlayerStatus.NONE;
		resetHand();
	}

	@Override
	public int compareTo(Player compPlayer) {
		/* For Ascending order*/
		return Integer.compare(this.pos, compPlayer.pos);
	}


	/**
	 * Returns the client.
	 * 
	 * @return The client.
	 */
	public Client getClient() {
		return client;
	}

	public void setStatus(String str)
	{
		status = str;
	}

	public String getStatus()
	{
		return status;
	}

	/**
	 * Prepares the player for another hand.
	 */
	public void resetHand() {
		prevCash = cash;
		winCash = BigDecimal.ZERO;
		isActive = false;
		isDone = false;
		isShow = false;
		isWinner = false;
		hasCards = false;
		status = "";
		handValue = "";
		hand.removeAllCards();
		resetBet();
	}

	/**
	 * Resets the player's bet.
	 */
	public void resetBet() {
		bet = BigDecimal.ZERO;
		if(action != Action.ANTE && action != Action.BUSTED)
			action = (hasCards() && BigDecimal.ZERO.equals(cash)) ? Action.ALL_IN : null;
	}

	/**
	 * Sets the hole cards.
	 */
	public void setCards(List<Card> cards) {
		hand.removeAllCards();
		if (cards != null) {
			if (cards.size() == 2) {
				hand.addCards(cards);
				hasCards = true;
//				System.out.format("[CHEAT] %s(%d)'s cards:\t%s\n", name, pos, hand);
			} else {
				throw new IllegalArgumentException("Invalid number of cards");
			}
		}
	}

	/**
	 * Returns whether the player has his hole cards dealt.
	 * 
	 * @return True if the hole cards are dealt, otherwise false.
	 */
	public boolean hasCards() {
		return hasCards;
	}

	/**
	 * Returns the player's name.
	 * 
	 * @return The name.
	 */
	public int getPos() {
		return pos;
	}

	/**
	 * Returns the player's email.
	 * 
	 * @return The email.
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Returns the player's name.
	 * 
	 * @return The name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * Returns the player's avatar.
	 * 
	 * @return The avatar.
	 */
	public int getAvatar() {
		return avatar;
	}

	/**
	 * Returns the player's current amount of cash.
	 * 
	 * @return The amount of cash.
	 */
	public BigDecimal getCash() {
		return cash;
	}

	public void setCash(BigDecimal d) {
		cash = d;
	}

	/**
	 * Returns the player's current bet.
	 * 
	 * @return The current bet.
	 */
	public BigDecimal getBet() {
		return bet;
	}

	/**
	 * Sets the player's current bet.
	 * 
	 * @param bet
	 *            The current bet.
	 */
	public void setBet(BigDecimal bet) {
		this.bet = bet;
	}

	/**
	 * Returns the player's most recent action.
	 * 
	 * @return The action.
	 */
	public Action getAction() {
		return action;
	}

	/**
	 * Sets the player's most recent action.
	 * 
	 * @param action
	 *            The action.
	 */
	public void setAction(Action action) {
		this.action = action;
	}

	/**
	 * Indicates whether this player is all-in.
	 * 
	 * @return True if all-in, otherwise false.
	 */
	public boolean isAllIn() {
		return hasCards() && (BigDecimal.ZERO.equals(cash));
	}

	public boolean isBot() {
		return isBot;
	}

	/**
	 * Returns the player's hole cards.
	 * 
	 * @return The hole cards.
	 */
	public Card[] getCards() {
		return hand.getCards();
	}

	/**
	 * Posts the small blind.
	 * 
	 * @param blind
	 *            The small blind.
	 */
	public void postSmallBlind(BigDecimal blind) {
		//        action = Action.SMALL_BLIND;
		cash = cash.subtract(blind);
		bet = bet.add(blind);
	}

	/**
	 * Posts the big blinds.
	 * 
	 * @param blind
	 *            The big blind.
	 */
	public void postBigBlind(BigDecimal blind) {
		//        action = Action.BIG_BLIND;
		cash = cash.subtract(blind);
		bet = bet.add(blind);
	}

	/**
	 * Pays an amount of cash.
	 * 
	 * @param amount
	 *            The amount of cash to pay.
	 */
	public void payCash(BigDecimal amount) {
//		if (amount.compareTo(cash) > 0) {
//			throw new IllegalStateException("Player asked to pay more cash than he owns!");
//		}
		cash = cash.subtract(amount);
		if(cash.compareTo(BigDecimal.ZERO) < 0)
			cash = BigDecimal.ZERO;
	}

	/**
	 * Wins an amount of money.
	 * 
	 * @param amount
	 *            The amount won.
	 */
	public void win(BigDecimal amount) {
		cash = cash.add(amount);
		winCash = amount;
	}

	/**
	 * Returns a clone of this player with only public information.
	 * 
	 * @return The cloned player.
	 */
	public Player publicClone() {
		Player clone = new Player();
		clone.join(isBot, isAutoRebuy, null, pos, email, name, avatar, cash, giftCategory, giftDetail);
		clone.hasCards = hasCards;
		clone.bet = bet;
		clone.action = action;
		clone.raise = raise;
		clone.playerStatus = playerStatus;
		clone.giftCategory = giftCategory;
		clone.giftDetail = giftDetail;
		clone.isActive = isActive;
		return clone;
	}

	/** {@inheritDoc} */
	@Override
	public String toString() {
		return name;
	}
	
	public void setGift(int category, int value)
	{
		giftCategory = category;
		giftDetail = value;		
	}
	
	public void updateHandValue(List<Card> board)
	{
		Hand hand = new Hand(board);
		hand.addCards(getCards());
		HandValue handVal = new HandValue(hand);
		handValue = handVal.toString();
	}

}
