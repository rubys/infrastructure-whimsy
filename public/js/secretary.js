var WorklistView = React.createClass({displayName: "WorklistView",
  getInitialState: function() {
    return {data: []}
  },
  render: function() {
    return (
      React.createElement("div", {className: "worklist"}, 
        React.createElement("h2", null, "Worklist"), 
        React.createElement(WorkList, {data: this.state.data})
      )
    );
  }
});
