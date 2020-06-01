package ivgroup.master.database.dto.callTransaction;

import java.nio.file.Path;

import javax.validation.constraints.NotEmpty;

public class CallTransactionFilePath {
@NotEmpty(message="QualifiedFilePath Cannot Be NULL")
Path qualifiedFilePath;

public CallTransactionFilePath() {
	
}
public CallTransactionFilePath(@NotEmpty(message = "QualifiedFilePath Cannot Be NULL") Path qualifiedFilePath) {
	super();
	this.qualifiedFilePath = qualifiedFilePath;
}

public Path getQualifiedFilePath() {
	return qualifiedFilePath;
}

public void setQualifiedFilePath(Path qualifiedFilePath) {
	this.qualifiedFilePath = qualifiedFilePath;
}


}
