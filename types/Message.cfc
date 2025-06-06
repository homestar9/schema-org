// --------------------------------------------------------
// AUTO-GENERATED: Message.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="bccRecipient" hint="A sub property of recipient. The recipient blind copied on a message.";

    property name="ccRecipient" hint="A sub property of recipient. The recipient copied on a message.";

    property name="dateRead" hint="The date/time at which the message has been read by the recipient if a single recipient exists.";

    property name="dateReceived" hint="The date/time the message was received if a single recipient exists.";

    property name="dateSent" hint="The date/time at which the message was sent.";

    property name="messageAttachment" hint="A CreativeWork attached to the message.";

    property name="recipient" hint="A sub property of participant. The participant who is at the receiving end of the action.";

    property name="sender" hint="A sub property of participant. The participant who is at the sending end of the action.";

    property name="toRecipient" hint="A sub property of recipient. The recipient who was directly sent the message.";


    variables[ "@type" ] = "Message";

    variables._mappers[ "_abstract" ] = "abstract";

}
