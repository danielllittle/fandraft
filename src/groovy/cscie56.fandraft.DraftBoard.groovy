package cscie56.fandraft



class DraftBoard {

    Queue<Player> draftBoard = new LinkedList<Player>();

    static constraints = {
    }

    void addPlayer(Player player) {
        draftBoard.add(player)
    }

    Player getNextPlayer() {
        draftBoard.poll()
    }

    Player getNextPlayerByPos(Position position) {
        Player player = draftBoard.findResult { player -> player.getPosition() == position ? player : null }
        removePlayer(player);
        player;
    }

    void removePlayer(Player player) {
        if (player != null) {
            draftBoard.remove(player);
        }
    }

}
