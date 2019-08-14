import React from 'react';
import './../css/RegisterMediaFileComponent.css';

class RegisterMediaFileComponent extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            firstName : "Tom",
            lastName : "Waits"
        };
    }

    registerMediaFile = () => {
        this.setState({firstName : "Billy", lastName : "Joel"});
    };

    render() {
        return (
            <div className="login-form-wrapper">
                <form>
                    <p>Dear <i>{this.state.firstName} {this.state.lastName}</i>,<br /> please register your latest track!</p>
                    <label>Title</label>
                    <input name={"fileName"}/>
                    <button type={"button"} onClick={this.registerMediaFile} value={"upload"} />
                </form>
                This is a login form
            </div>
        );
    }
}

export default RegisterMediaFileComponent;
