package ivgroup.master.database.dto.callTransaction;

import java.nio.file.Path;

import javax.validation.constraints.NotNull;

public class CallTransactionFilePath {
@NotNull(message="QualifiedFilePath Cannot Be NULL")
Path qualifiedFilePath;

public CallTransactionFilePath() {
	
}
public CallTransactionFilePath(@NotNull(message = "QualifiedFilePath Cannot Be NULL") Path qualifiedFilePath) {
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
